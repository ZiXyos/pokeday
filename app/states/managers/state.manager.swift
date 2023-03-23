//
//  state.manager.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

protocol StateServices_P {
	
	var appManager: AppStateManager { get };
	var authManager: AuthStateManager { get set };
	var pokeApiSdk: PokeSdkClient { get };
}

class AppState: StateServices_P {
	
	var appManager: AppStateManager;
	var authManager: AuthStateManager;
	var pokeApiSdk: PokeSdkClient;
	
	public init(pokeSdkClient: PokeSdkClient) {
		
		self.appManager = AppStateManager();
		self.pokeApiSdk = pokeSdkClient;
		self.authManager = AuthStateManager(appManager: self.appManager)
	}
}
