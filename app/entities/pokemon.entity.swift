//
//  pokemon.entity.swift
//  pokeday
//
//  Created by Ktchoumh on 3/29/23.
//

import Foundation
import CoreData;

public final class PokemonEntity {
	
	@NSManaged var id: Int;
	@NSManaged var name: String;
	@NSManaged var level: Int;
	@NSManaged var base_experience: Int;
	@NSManaged var height: Int;
	@NSManaged var is_default: Bool;
	@NSManaged var order: Bool;
	@NSManaged var weight: Int;
	@NSManaged var type: [String];
}
