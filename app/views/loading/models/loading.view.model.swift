//
//  loading.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/28/23.
//

import Foundation;
import SwiftUI;
import CoreData;
import AVFAudio;

class LoadingViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	private let viewContext = AppController.shared.viewContext;
	let appCache: NSCache<NSString, CacheEntry<Dictionary<Int, [Pokemon_s]>>>;
	
	public let player: AudioManager;
	
	var pokemons = Dictionary<Int, [Pokemon_s]>();
	var pkmnArr: [Pokemon_s] = [];
	var limitGen: Int = 1;
	
	public override init(services: StateServices_P) {
		
		guard let url = Bundle.main.url(
			forResource: "pokemon_rb_intro",
			withExtension: ".mp3"
		) else {
			fatalError("error finding files");
		}
	
		self.player = AudioManager(url: url);
		self.appCache = NSCache();
		super.init(services: services);
	}
	
	public func getRemoteData() async throws -> Void {

		for i in 1...self.limitGen {
			
			if self.services.pokemonCache.object(
				forKey: NSString(
					string: "pokemon-cached-region"
				)
			) == nil {
				
				let res = try await self.services.pokeApiSdk.gens.getGenById( //these request could be skipped
					id: String(i)
				);
				
				for v in res.pokemon_species {
					
					let id = URL(string: v.url)?.lastPathComponent ?? "";
					try await self.setRemotePokemon(id: id);
				}
				
				self.pokemons[i] = self.pkmnArr;
			}
		}
		
		self.services.pokemonCache.setObject(
			CacheEntry(
				status: .ready(self.pokemons),
				value: self.pokemons,
				key: "pokemon-cached-region"
			),
			forKey: "pokemon-cached-region" as NSString
		);

		if let _ = self.services.pokemonCache.object(
			forKey: "pokemon-cached-region" as NSString
		) {
			self.pkmnArr.removeAll();
		} else {
			throw CacheError.emptyEntity(entityType: type(of: self.pokemons))
		}
	}

	private func setRemotePokemon(id: String) async throws -> Void {

		let res = try await self.services.pokeApiSdk.pokemons.getPokemonById(
			pokemonId: id
		);
		var type: [String] = [];

		for v in res.types {
			type.append(v.type.name);
		}

		do {
			let jsonData = try JSON.encoder.encode(res.sprites);
			let sprites = try JSONDecoder().decode(PokemonSprites.self, from: jsonData)
		
		
			let pokemon = Pokemon_s(
				id: res.id,
				name: res.name,
				base_experience: res.base_experience,
				height: res.height,
				is_default: res.is_default,
				order: true,
				weight: res.weight,
				abilities: [PokemonAbility(id: 1, name: "FireBolt", is_main_series: true)],
				type: type,
				sprites: sprites
			);

			self.pkmnArr.append(pokemon);
		} catch let error {
			print(error.localizedDescription);
		}
	}
	
	
	public func play() -> Void {
		
		self.player.initPlayer();
		let _ = self.player.play();
	}
	public func stop() -> Void {
		if self.player.isPlaying() {
			self.player.stop();
		}
	}
	
	
	private func isLimit(generation: Int) -> Bool {

		if limitGen == generation {
			return true;
		}
		return false;
	}
	
	private func setLimitGen(gen: Int) -> Void {
		self.limitGen = gen;
	}
}
