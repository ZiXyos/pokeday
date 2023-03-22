//
//  login.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation


public class LoginViewModel: ObservableObject {
	
	@Published var isAuth: Bool = false;
	
	public func loginWithUsername(
		username: String,
		password: String
	) -> Void {
		
		print("[LOG]: Logging In with Username !!!");
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
