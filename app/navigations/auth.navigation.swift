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
	
	@ViewBuilder public func authScreen() -> some View {
		
		AuthView(nav: self);
	}
	
	@ViewBuilder public func loginScreen() -> some View {
		LoginView(
			viewModel: LoginViewModel(services: self.stateService)
		);
	}
	
	@ViewBuilder public func registerScreen() -> some View {
		
		RegisterView(nav: self);
	}
	
	@ViewBuilder public func registerFormNavigation() -> RegisterFormView {
		RegisterFormView(
			nav: self,
			viewModel: RegisterViewModel(
				services: self.stateService)
		);
	}
}

struct AuthNAvigationView: View {

	@StateObject var nav: AuthNavigation;

    var body: some View {
		
		NavigationStack {
			self.nav.authScreen();
		}
    }
}

extension AuthNavigation: AuthNavView {
	
	@ViewBuilder func registerViewNavigation() -> RegisterView {
		RegisterView(nav: self);
	}
	
	@ViewBuilder func loginViewNavigation() -> LoginView {
		LoginView(
			viewModel: LoginViewModel(
				services: self.stateService
			)
		);
	}
}

extension AuthNavigation: RegisterNavigationView {
	
	@ViewBuilder func registerFormViewNavigation() -> RegisterFormView {
		
		RegisterFormView(
			nav: self,
			viewModel: RegisterViewModel(
				services: self.stateService
			)
		);
	}
}

extension AuthNavigation: RegisterFormNavigationView {

	@ViewBuilder func userFormViewNavigation() -> UserFormView {
		UserFormView(
			viewModel: UserFormViewModel(
				services: self.stateService
			)
		);
	}
}

