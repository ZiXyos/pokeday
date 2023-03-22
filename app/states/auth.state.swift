//
//  auth.state.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

public class AuthState: ObservableObject {
	
	@Published var isLogged: Bool = false;
	@Published var usertoken: String?;
}
