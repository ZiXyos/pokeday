//
//  pokemon.form.type.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation

struct PokemonForm: Codable {
	
	let id: Int;
	var name: String;
	let order: Int;
	let form_order: Int;
	var is_default: Bool;
	var is_battle_only: Bool;
	var is_mega: Bool;
	var form_name: String;
}
