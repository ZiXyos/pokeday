//
//  login.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;
import Combine;


class LoginViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	public override init(services: StateServices_P) {

		super.init(services: services);
	}
	
	public func loginWithUsername(
		username: String,
		password: String
	) -> Void {

		self.services.authManager.login(token: username);
	}
	
	public func loginWithEmail(
		email: String,
		password: String
	) -> Void {
		
		print("[LOG]: Logging In with Email !!!");
	}
	
	public func logingWithGoogle() -> Void {
		
		print("[LOG]: Logging in with Google !!!");
	}
	
	public func forgotPassword(username: String) -> Void {
		
		print("[LOG]: Forgot Password");
	}
}
