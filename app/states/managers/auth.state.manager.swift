//
//  auth.state.manager.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation

protocol AuthStateManager_P {
	
	var authState: AuthState { get set };
	
	func login(token: String);
	func logout();
}

struct AuthStateManager: AuthStateManager_P {
	
	var authState: AuthState = AuthState();
	private var appStateManager: AppStateManager;
	
	public init(appManager: AppStateManager) {
		self.appStateManager = appManager;
	}
	
	public func login(token: String) {
		self.authState.isLogged.toggle();
		self.appStateManager.setDefault(
			.isAuth,
			value: self.authState.isLogged
		);
		
		self.authState.usertoken = token;
		self.appStateManager.setDefault(
			.token,
			value: self.authState.usertoken!
		);
		
	}
	
	public func logout() {
		self.authState.isLogged.toggle();
	}
	
	
	private func initValues() -> Void {
		
		self.authState.isLogged = self.appStateManager.getDefault(.isAuth);
		self.authState.usertoken = self.appStateManager.getDefault(.token);
	}
}
