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
		
		self.fetchLocalPokemon();
	}
	
	private func fetchLocalPokemon() {
		
		let req = NSFetchRequest<Pokemon>(entityName: "Pokemon");
		
		do {
			self.pokemons = try viewContext.fetch(req);
		} catch {
			fatalError(error.localizedDescription);
		}
	}
	
	public func play() -> Void {
		
		self.player.initPlayer();
	
		let _ = self.player.play();
	}
	
	private func setRemotePokemon(id: String) async throws -> Void {
		
		let res = try await self.services.pokeApiSdk.pokemons.getPokemonById(
			pokemonId: id
		);
		
		let pokemon = Pokemon(context: self.viewContext);
		pokemon.id = Int64(res.id);
		pokemon.name = res.name;
		pokemon.height = Int32(res.height);
		pokemon.base_experience = Int32(res.base_experience);
		//await self.save();
		print("[LOG::FETCHED::POKEMON]: \(res.name)");
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
	
	private func save() async -> Void {

		do {
			try self.viewContext.save()
		}catch {
			print("Error saving");
			fatalError(error.localizedDescription);
		}
	}
}
