//
//  pokemon.res.dto.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

public struct PokemonDto: Codable {
	
	let id: Int;
	let name: String;
	let base_experience: Int;
	let height: Int;
	let is_default: Bool;
	let order: Bool;
	let weight: Int;
}

public class PokemonResDto: Codable {
	
	public var status: Int;
	public var data: PokemonDto;
	
	enum Keys: String, CodingKey {
		
		case status
		case data
	}
	
	public required init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: Keys.self);
		self.status = try container.decode(Int.self, forKey: .status);
		self.data = try container.decode(PokemonDto.self, forKey: .data);
	}
}
