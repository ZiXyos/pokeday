//
//  login.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;
import Combine;
import FirebaseAuth;


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
	
	public func register(
		email: String,
		password: String
	) -> Void {

		Auth.auth().createUser(
			withEmail: email,
			password: password
		) { [weak self] authResult, error in
			guard self != nil else { return }
			print(
				"[LOG]::[REGISTER]: \(String(describing: authResult)) or \(String(describing: error))"
			);
		}
	}
}
