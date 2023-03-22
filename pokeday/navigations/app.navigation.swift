//
//  app.navigation.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;
import Combine;
import SwiftUI;

enum AppNavigationScreen {
	
	case auth;
	case tab;
}

class AppNavigation: ObservableObject {
	
	@Published var screen: AppNavigationScreen = .auth;
	private var anyCancellable = Set<AnyCancellable>();
	lazy private var authNav: AuthNavigation = {
		return AuthNavigation();
	}();
	
	init() {}
	
	@ViewBuilder public func authScreen() -> some View {
		
		AuthNAvigationView(nav: self.authNav);
	}
	
	@ViewBuilder public func tabScreen() -> some View {
		
			Text("Tab View");
	}
}

public struct AppNavigationView: View {
	
	@StateObject var appNavigation: AppNavigation;
	
	public var body: some View {
		
		switch self.appNavigation.screen {
			
		case .auth:
			self.appNavigation.authScreen();
		case .tab:
			self.appNavigation.tabScreen();
		}
	}
}
