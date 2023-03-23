//
//  pokedex.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import Foundation

class PokedexViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	@Published var pokemons = [Pokemon]();
	public override init(services: StateServices_P) {
		super.init(services: services);
	}
	
	public func fetchPokemon() async throws -> Void {
		let data = try await self.services.pokeApiSdk.pokemons.getAllPokemon(
			limit: "60", offset: "60"
		);
		
		print("[LOG]: ", data);
	}
}
