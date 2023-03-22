//
//  auth.navigation.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;
import SwiftUI;
import Combine;

class AuthNavigation: ObservableObject {
	
	private var stateService: StateServices_P;
	
	init(stateService: StateServices_P) {
		self.stateService = stateService;
	}
	
	@ViewBuilder public func loginScreen() -> some View {
		LoginView(
			viewModel: LoginViewModel(services: self.stateService)
		);
	}
	
	@ViewBuilder public func registerScreen() -> some View {
		
		Text("RegisterScreen");
	}
}

struct AuthNAvigationView: View {

	@StateObject var nav: AuthNavigation;

    var body: some View {
		
		NavigationStack {
			self.nav.loginScreen();
		}
    }
}
