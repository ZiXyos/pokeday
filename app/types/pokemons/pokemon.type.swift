//
//  pokemon.type.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

public struct Pokemon_s: Codable {
	
	let id: Int;
	var name: String;
	let base_experience: Int;
	var height: Int;
	let is_default: Bool;
	var order: Bool;
	var weight: Int;
	var abilities: [PokemonAbility];
	let forms: [String];
	let type: [String];
}
