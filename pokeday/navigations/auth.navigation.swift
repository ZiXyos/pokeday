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
	
	@ViewBuilder public func loginScreen() -> some View {
		LoginView(
			viewModel: LoginViewModel()
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

struct auth_navigation_Previews: PreviewProvider {
    static var previews: some View {
        AuthNAvigationView(
			nav: AuthNavigation()
		)
    }
}
