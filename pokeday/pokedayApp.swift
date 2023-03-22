//
//  pokedexApp.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import SwiftUI;

@main
struct pokedexApp: App {
	
	let client: PokeSdkClient;

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
	
	init() {
		let clientOptions: ClientOptions = ClientOptions();
		self.client = PokeSdkClient(clientOptions: clientOptions);
	}
}
