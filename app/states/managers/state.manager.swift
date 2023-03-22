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
}

class AppState: StateServices_P {
	
	var appManager: AppStateManager;
	var authManager: AuthStateManager;
	
	public init() {
		
		self.appManager = AppStateManager();
		self.authManager = AuthStateManager(appManager: self.appManager)
	}
}
