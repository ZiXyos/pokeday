//
//  client.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

struct ClientOptions {
	
	var baseUrl: String?;
	var apiVersion: String?;
}

class Client {
	
	private let httpClient: HttpClient;
	
	public let baseUrl: String;
	public let apiVersion: String;
	
	public let pokemons: PokemonRessources;
	
	init(clientOptions: ClientOptions) {
		
		self.apiVersion = (clientOptions.apiVersion ?? "v2/");
		self.baseUrl = (
			clientOptions.baseUrl ?? "https://pokeapi.co/api/"
		) + self.apiVersion;
		self.httpClient = HttpClient(baseUrl: self.baseUrl);
		
		
		self.pokemons = PokemonRessources(httpClient: self.httpClient)
	}
}
