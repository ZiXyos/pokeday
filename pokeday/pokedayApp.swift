//
//  pokedexApp.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import SwiftUI;

@main
struct pokedexApp: App {
	
	let client: Client;

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
	
	init() {
		let clientOptions: ClientOptions = ClientOptions();
		self.client = Client(clientOptions: clientOptions);
	}
}
