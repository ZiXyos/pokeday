//
//  loading.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/28/23.
//

import Foundation

class LoadingViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	var limitGen: Int = 3;
	
	public override init(services: StateServices_P) {
		super.init(services: services);
	}
	
	public func getRemoteData() async throws -> Void {

		for i in 1...self.limitGen {

			let res = try await self.services.pokeApiSdk.gens.getGenById(id: String(i))
			for v in res.pokemon_species {

				let id = URL(string: v.url)?.lastPathComponent ?? "";
				try await self.setRemotePokemon(id: id);
			}
		}
	}

	public func loadLocalData() async throws -> Void {
		
	}
	
	private func setRemotePokemon(id: String) async throws -> Void {
		
		let res = try await self.services.pokeApiSdk.pokemons.getPokemonById(
			pokemonId: id
		);
		

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
}
