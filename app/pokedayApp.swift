//
//  pokedexApp.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import SwiftUI;
import AVFAudio;
import FirebaseCore;
import FirebaseFirestore;

@main
struct pokedexApp: App {
	
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate;
	@StateObject private var appController = AppController.shared;

	let client: PokeSdkClient;
	let audioSession: AVAudioSession;
	
	private var nav: AppNavigation;
	private var appService: StateServices_P;
	
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

class AppDelegate: NSObject, UIApplicationDelegate {

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [
			UIApplication.LaunchOptionsKey : Any
		]? = nil
	) -> Bool {
	
		FirebaseApp.configure()
		return true;
	}
}
