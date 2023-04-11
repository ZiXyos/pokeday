//
//  region.ressource.swift
//  pokeday
//
//  Created by Ktchoumh on 3/30/23.
//

import Foundation

public class GenerationRessource {
	
	private let httpClient: HttpClient;

	init(httpClient: HttpClient) {
		
		self.httpClient = httpClient;
	}
	
	public func getAllGens(limit: String, offset: String) async throws -> GetAllPokemonDto {
		
		let res: GetAllPokemonDto = try await self.httpClient.get(
			route: "generation/",
			params: [
				URLQueryItem(name: "limit", value: limit),
				URLQueryItem(name: "offset", value: offset)
			]
		);
		
		return res;
	}

	public func getGenByName(name: String) async throws -> GenerationResDto {
		
		let res: GenerationResDto = try await self.httpClient.get(
			route: "generation/\(name)",
			params: nil
		);
		
		return res;
	}
	
	public func getGenById(id: String) async throws -> GenerationResDto {
		
		let res: GenerationResDto = try await self.httpClient.get(
			route: "generation/" + id,
			params: nil
		);
		
		return res;
	}
}
