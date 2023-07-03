//
//  login.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;
import Combine;
import FirebaseAuth;
import FirebaseFirestore;

class LoginViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	let db: Firestore = Firestore.firestore();
	public override init(services: StateServices_P) {

		super.init(services: services);
	}
	
	public func loginWithUsername(
		username: String,
		password: String
	) -> Void {

		Auth.auth().signIn(
			withEmail: username,
			password: password
		) { [weak self] authResult, error in
			guard let strongSelf = self else { return }
			strongSelf.services.authManager.login(token: username);
		}
	}
	
	public func loginWithEmail(
		email: String,
		password: String
	) -> Void {
		
		Auth.auth().signIn(
			withEmail: email,
			password: password
		) { [weak self] authResult, error in
			guard let strongSelf = self else { return }
			strongSelf.services.authManager.login(token: email);
		}
	}
	
	
	public func logingWithGoogle() -> Void {
		
		print("[LOG]: Logging in with Google !!!");
	}
	
	public func forgotPassword(username: String) -> Void {
		
		print("[LOG]: Forgot Password");
	}
}
