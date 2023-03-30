//
//  region.res.dto.swift
//  pokeday
//
//  Created by Ktchoumh on 3/30/23.
//

import Foundation

public class RegionResDto: Codable {
	
	public let id: Int;
	public let name: String;
	public let pokemon_species: [ResultsGetAllPokemonDto]
}
