//
//  pokedex.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import Foundation

class PokedexViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	@Published var pkms = Dictionary<Int, [Pokemon_s]>();

	public override init(services: StateServices_P) {
		
		super.init(services: services);
		
		if let data = self.services.pokemonCache.object(
			forKey: "pokemon-cached-region" as NSString
		)  {
			self.pkms = data.getData();
			for (k, v) in self.pkms {
				print("[Region]: \(k)");
				for pkm in v {
					print("\t[Pokemon]: \(pkm.name)");
				}
			}
		}
	}
}



