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
	@StateObject private var appController = AppController(factory: AppControllerFactory());
	
    var body: some Scene {
		WindowGroup {
			AppNavigationView(
				appNavigation: self.nav
			).environment(
				\.managedObjectContext,
				 appController.appContainer.viewContext
			)
		}
    }

	init() {

		let clientOptions: ClientOptions = ClientOptions();
		self.client = PokeSdkClient(clientOptions: clientOptions);

		self.appService = AppState(pokeSdkClient: self.client);
		self.nav = AppNavigation(stateService: self.appService);
	}
}
