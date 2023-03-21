//
//  pokemon.ressource.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

class PokemonRessources {
	
	private let httpClient: HttpClient;

	init(httpClient: HttpClient) {
		
		self.httpClient = httpClient;
	}
	
	public func getPokemonById(pokemonId: String) async throws -> PokemonResDto {
		
		let res: PokemonResDto = try await self.httpClient.get(
			route: "pokemon/" + pokemonId
		);
		return res;
	}
	
	public func getPokemonByName(pokemonName: String) async throws -> PokemonResDto {
		
		let res: PokemonResDto = try await self.httpClient.get(
			route: "pokemon/" + pokemonName
		);
		return res;
	}
}
