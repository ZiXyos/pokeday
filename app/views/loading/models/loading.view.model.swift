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
	let appCache: NSCache<NSString, CacheEntry<Pokemon_s>>;
	
	public let player: AudioManager;
	
	@Published var pokemons: [Pokemon] = [];
	var limitGen: Int = 3;
	
	public override init(services: StateServices_P) {
		
		guard let url = Bundle.main.url(
			forResource: "pokemon_rb_intro",
			withExtension: ".mp3"
		) else {
			fatalError("error finding files");
		}
		print("[LOG]: \(url)");
	
		self.player = AudioManager(url: url);
		self.appCache = NSCache();
		super.init(services: services);
	}
	
	public func getRemoteData() async throws -> Void {

		for i in 1...self.limitGen {

			let res = try await self.services.pokeApiSdk.gens.getGenById(
				id: String(i)
			);
			
			for v in res.pokemon_species {

				let id = URL(string: v.url)?.lastPathComponent ?? "";
				try await self.setRemotePokemon(id: id);
			}
		}
	}

	public func loadLocalData() async throws -> Void {
		
	}
	
	public func play() -> Void {
		
		self.player.initPlayer();
	
		let _ = self.player.play();
	}
	
	private func setRemotePokemon(id: String) async throws -> Void {
		
		let res = try await self.services.pokeApiSdk.pokemons.getPokemonById(
			pokemonId: id
		);

		let pokemon = Pokemon_s(
			id: res.id,
			name: res.name,
			base_experience: res.base_experience,
			height: res.height,
			is_default: res.is_default,
			order: true,
			weight: res.weight,
			abilities: [PokemonAbility(id: 1, name: "FireBolt", is_main_series: true)],
			type: ["Fire", "Fly"]
		);
		
		let cachedItem = CacheEntry<Pokemon_s>(
			status: .ready(pokemon),
			value: pokemon,
			key: String(describing: pokemon.id)
		);
		self.appCache[String(pokemon.id)] = cachedItem;
		
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
