//
//  pokeday.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/29/23.
//

import Foundation;
import CoreData;

class AppController: ObservableObject {

	let appContainer: NSPersistentContainer;
	let factory: AppControllerFactory;

	init(factory: AppControllerFactory) {
		
		self.factory = factory;
		
		self.appContainer = NSPersistentContainer(
			name: "AppModel",
			managedObjectModel: factory.initEntity()
		)
	}
}

class AppControllerFactory {
	
	func initEntity() -> NSManagedObjectModel {
		
		let userEntity = NSEntityDescription();
		userEntity.name = "User";
		userEntity.managedObjectClassName = NSStringFromClass(UserEntity.self);
		
		let pokemonEntity = NSEntityDescription();
		pokemonEntity.name = "Pokemon";
		pokemonEntity.managedObjectClassName = NSStringFromClass(PokemonEntity.self);
		pokemonEntity.isAbstract = true;
		
		let model = NSManagedObjectModel();
		model.entities = [
				userEntity,
				pokemonEntity
		];
		
		return model;
	}
}
