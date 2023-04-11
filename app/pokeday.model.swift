//
//  pokeday.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/29/23.
//

import Foundation;
import CoreData;

class AppController: ObservableObject {

	static let shared = AppController(inMemory: true);
	let appContainer: NSPersistentContainer;
	var viewContext: NSManagedObjectContext {
		
		return self.appContainer.viewContext;
	}

	init(inMemory: Bool = false) {

		self.appContainer = NSPersistentContainer(
			name: "AppModel"
		);
		
		if inMemory {
			self.appContainer.persistentStoreDescriptions.first!.url = URL(
				fileURLWithPath: "/dev/null"
			);
			
			self.appContainer.loadPersistentStores(
				completionHandler: { (storeDescription, error) in
				
					if let error = error as NSError? {
						fatalError(
							"[LOG::ERROR::Unresolved]: \(error), \(error.userInfo)"
						)
					}
				}
			);
	
			self.appContainer.viewContext.automaticallyMergesChangesFromParent = true;
		}
	}
	
	static func initEntity() -> NSManagedObjectModel {
		
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

class AppControllerFactory {
	
	
}
