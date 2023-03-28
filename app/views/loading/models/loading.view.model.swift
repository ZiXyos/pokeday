//
//  loading.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/28/23.
//

import Foundation

class LoadingViewModel: TemplateViewModel<StateServices_P>, ObservableObject {

	
	public override init(services: StateServices_P) {
		super.init(services: services);
	}
	
	public func loadRemoteData() async throws -> Void {
		var res = try await self.services.pokeApiSdk.pokemons.getAllPokemon(limit: "60", offset: "0");
		for k in res.results {
			
			print("[LOG::FETCHED::POKEMON]:\(k.name)");
		}
		
		while res.next != nil {
			
			res = try await self.services.pokeApiSdk.pokemons.fetchNextPage(next: res.next ?? "");
			for k in res.results {
				print("[LOG::FETCHED::POKEMON]:\(k.name)");
			}
			print("[LOG::NEXTPAGE]:\(String(describing: res.next))");
		}
	}

	public func loadLocalData() async throws -> Void {
		
	}
}
