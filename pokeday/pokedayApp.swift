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
	private var nav: AppNavigation;
	private var appService: StateServices_P;

    var body: some Scene {
		WindowGroup {
			AppNavigationView(
				appNavigation: self.nav
			)
		}
    }

	init() {

		let clientOptions: ClientOptions = ClientOptions();

		self.appService = AppState();
		self.client = PokeSdkClient(clientOptions: clientOptions);
		self.nav = AppNavigation(stateService: self.appService);
	}
}
