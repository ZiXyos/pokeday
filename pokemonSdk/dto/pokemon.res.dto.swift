//
//  pokemon.res.dto.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

public class ResultsGetAllPokemonDto: Codable, Identifiable {
	
	public var name: String;
	public var url: String;
}

public class GetAllPokemonDto: Codable {
	
	public var count: Int;
	public var next: String?;
	public var previous: String?;
	public var results: [ResultsGetAllPokemonDto];
}

public struct PokemonSpritesDto: Codable {
	
	public let front_default: String;
	public let front_shiny: String;
	public var front_female: String? = nil;
	public var front_shiny_female: String? = nil;
	public let back_default: String;
	public let back_shiny: String;
	public var back_female: String? = nil;
	public var back_shiny_female: String? = nil;
}

public struct TypeResDto: Codable {

	public let id: Int;
	public let name: String;
}

public struct TypeDto: Codable {
	
	public let name: String;
	public let url: String;
}

public struct PokemonTypeDto: Codable {
	
	public let slot: Int;
	public let type: TypeDto
}

public struct PokemonDto: Codable, Identifiable {
	
	public let id: Int;
	public var name: String;
	public let base_experience: Int;
	public var height: Int;
	public let is_default: Bool;
	//public var order: Bool;
	public var weight: Int;
	// public var abilities: [PokemonAbility];
	//public let forms: [String];
	public let types: [PokemonTypeDto];
	public let sprites: PokemonSpritesDto;
}

public class PokemonResDto: Codable {
	
	public var data: PokemonDto;
	
	enum Keys: String, CodingKey {
		
		case status
		case datas
	}
	
	public required init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: Keys.self);
		self.data = try container.decode(PokemonDto.self, forKey: .datas);
	}
}
