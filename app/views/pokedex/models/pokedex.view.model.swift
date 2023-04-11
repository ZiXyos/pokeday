//
//  pokedex.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import Foundation

class PokedexViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	@Published var storedResult = [GetAllPokemonDto]();
	@Published var pokemons = [PokemonDto]();
	public override init(services: StateServices_P) {
		super.init(services: services);
	}
	
	public func fetchAllPokemons() async throws -> Void {

		print("[LOG]: Fetching 60 first pokemon");
		let data = try await self.services.pokeApiSdk.pokemons.getAllPokemon(
			limit: "5", offset: "10"
		);
		
		self.storedResult.append(data);
		Task(priority: .background) {
			for res in self.storedResult {
				print("\(res)");
				for pokemon in res.results {
					print("\(pokemon)");
					try await self.fetchPokemonByName(name: pokemon.name);
				}
			}
		}
	}
	
	private func fetchPokemonByName(name: String) async throws -> Void {
		print("[LOG]: Fetching \(name)");
		let data = try await self.services.pokeApiSdk.pokemons.getPokemonByName(
			pokemonName: name
		);
		//appen only if not in list
		self.pokemons.append(data);
	}

	private func fetchPokemonById(id: String) async throws -> Void {
		
		let data = try await self.services.pokeApiSdk.pokemons.getPokemonById(
			pokemonId: id
		);
		
		self.pokemons.append(data);
	}
	
}
