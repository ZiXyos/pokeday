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
	var authState: AuthState { get set };
	var pokemonCache: NSCache<
		NSString,
		CacheEntry<Dictionary<Int, [Pokemon_s]>>
	> { get set};
	var userCache: NSCache<
		NSString,
		CacheEntry<UserDocument>
	> { get set }
}

class AppState: StateServices_P {
	
	var appManager: AppStateManager;
	var authManager: AuthStateManager;
	var authState: AuthState;
	var pokeApiSdk: PokeSdkClient;
	var pokemonCache: NSCache<
		NSString,
		CacheEntry<Dictionary<Int, [Pokemon_s]>>
	>
	var userCache: NSCache<NSString, CacheEntry<UserDocument>>;
	
	public init(pokeSdkClient: PokeSdkClient) {
		
		self.appManager = AppStateManager();
		self.pokeApiSdk = pokeSdkClient;
		self.authState = AuthState();
		self.authManager = AuthStateManager(
			authState: self.authState,
			appManager: self.appManager
		);
		self.pokemonCache = NSCache();
		self.userCache = NSCache();
	}
}
