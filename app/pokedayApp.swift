//
//  pokedexApp.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import SwiftUI;
import AVFAudio;

@main
struct pokedexApp: App {

	let client: PokeSdkClient;
	let audioSession: AVAudioSession;
	
	private var nav: AppNavigation;
	private var appService: StateServices_P;
	@StateObject private var appController = AppController.shared;
	
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
		self.audioSession = AVAudioSession.sharedInstance();
		self.appService = AppState(pokeSdkClient: self.client);
		self.nav = AppNavigation(stateService: self.appService);
		
		do {
			try self.audioSession.setCategory(.soloAmbient);
			try self.audioSession.setActive(true);
		} catch {
			fatalError(error.localizedDescription);
		}
	}
}
