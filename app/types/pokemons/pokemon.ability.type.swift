//
//  abilities.type.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation

public struct PokemonAbility: Codable, Identifiable {
	
	public let id: Int;
	public let name: String;
	public let is_main_series: Bool;
}
