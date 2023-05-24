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
	
	public func getPokemonById(pokemonId: String) async throws -> PokemonDto {
		
		let res: PokemonDto = try await self.httpClient.get(
			route: "pokemon/" + pokemonId,
			params: nil
		);
		return res;
	}
	
	public func getPokemonByName(pokemonName: String) async throws -> PokemonDto {
		
		let res: PokemonDto = try await self.httpClient.get(
			route: "pokemon/" + pokemonName,
			params: nil
		);
		return res;
	}
	
	public func getAllPokemon(limit: String, offset: String) async throws -> GetAllPokemonDto {
		
		let res: GetAllPokemonDto = try await self.httpClient.get(
			route: "pokemon/",
			params: [
				URLQueryItem(name: "limit", value: limit),
				URLQueryItem(name: "offset", value: offset)
			]
		);
		
		return res;
	}
	
	public func fetchNextPage(next: String) async throws -> GetAllPokemonDto {
	
		var res: GetAllPokemonDto?;
	
		if let components = URLComponents(string: next) {
			if let offset = components.queryItems?.first(where: { $0.name == "offset" })?.value,
			   let limit = components.queryItems?.first(where: { $0.name == "limit" })?.value {
				res = try await self.httpClient.get(
				   route: "pokemon/",
				   params: [
					   URLQueryItem(name: "limit", value: limit),
					   URLQueryItem(name: "offset", value: offset)
				   ]
			   )
			}
		}
		
		guard let result = res else {
			throw CancellationError()
		}
		
		return result;
	}
	
	public func getPokemonTypeById(pokemonTypeId: String) async throws -> PokemonTypeDto {
		
		let res: PokemonTypeDto = try await self.httpClient.get(
			route: "type/" + pokemonTypeId,
			params: nil
		);
		
		return res;
	}
	
	public func getPokemonTypeByName(pokemonTypeName: String) async throws -> PokemonTypeDto {
		
		let res: PokemonTypeDto = try await self.httpClient.get(
			route: "type/" + pokemonTypeName,
			params: nil
		);
		
		return res;
	}
}
