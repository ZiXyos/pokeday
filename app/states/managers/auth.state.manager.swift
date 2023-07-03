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
	
	var authState: AuthState;
	private var appStateManager: AppStateManager;
	
	public init(
		authState: AuthState,
		appManager: AppStateManager
	) {
		self.appStateManager = appManager;
		self.authState = authState;
	}
	
	public func login(token: String) {
		
		self.authState.usertoken = token;
		self.appStateManager.setDefault(
			.token,
			value: self.authState.usertoken ?? token
		);
		
		self.authState.isLogged.toggle();
		self.appStateManager.setDefault(
			.isAuth,
			value: self.authState.isLogged
		);
	}
	
	public func logout() {

		removeCacheOndisk(withName: "user");
		self.authState.isLogged.toggle();
		self.appStateManager.setDefault(.isAuth, value: self.authState.isLogged);
	}
	
	private func initValues() -> Void {
		
		self.authState.isLogged = self.appStateManager.getDefault(.isAuth);
		self.authState.usertoken = self.appStateManager.getDefault(.token);
	}
}
