//
//  pokemon.res.dto.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

public class PokemonResDto: Codable {
	
	public var status: Int;
	public var data: Pokemon;
	
	enum Keys: String, CodingKey {
		
		case status
		case data
	}
	
	public required init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: Keys.self);
		self.status = try container.decode(Int.self, forKey: .status);
		self.data = try container.decode(Pokemon.self, forKey: .data);
	}
}
