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
	
	public func getAllRegions(limit: String, offset: String) async throws -> GetAllPokemonDto {
		
		let res: GetAllPokemonDto = try await self.httpClient.get(
			route: "generation/",
			params: [
				URLQueryItem(name: "limit", value: limit),
				URLQueryItem(name: "offset", value: offset)
			]
		);
		
		return res;
	}

	public func getRegionByName(name: String) async throws -> RegionResDto {
		
		let res: RegionResDto = try await self.httpClient.get(
			route: "generation/\(name)",
			params: nil
		);
		
		return res;
	}
	
	public func getRegionById(id: String) async throws -> RegionResDto {
		
		let res: RegionResDto = try await self.httpClient.get(
			route: "generation/" + id,
			params: nil
		);
		
		return res;
	}
}
