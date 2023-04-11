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
	private var appServices: StateServices_P;
	
	lazy private var authNav: AuthNavigation = {
		return AuthNavigation(stateService: appServices);
	}();
	
	lazy private var tabNav: TabNavigation = {
		return TabNavigation(stateService: appServices);
	}();
	
	init(stateService: StateServices_P) {
		self.appServices = stateService;
		self.setBindings();
	}
	
	public func setBindings() {
		   
		   self.appServices.authManager.authState.$isLogged.sink {
			   
			   [weak self] (value) in
			   
			   if value == true {
				   
				   self?.screen = .tab;
			   } else {
				   self?.screen = .auth;
			   }
		   }.store(in: &self.anyCancellable)
	   }
	
	@ViewBuilder public func authScreen() -> some View {
		
		AuthNAvigationView(nav: self.authNav);
	}
	
	@ViewBuilder public func tabScreen() -> some View {
		TabNavigationView(nav: self.tabNav);
	}
	
	@ViewBuilder public func loadingScreen() -> some View {
		
		LoadingView(
			viewModel: LoadingViewModel(
				services: AppState(
					pokeSdkClient: PokeSdkClient(
						clientOptions: ClientOptions()
					)
				)
			)
		);
	}
}

public struct AppNavigationView: View {
	
	@StateObject var appNavigation: AppNavigation;
	
	public var body: some View {
		
		switch self.appNavigation.screen {
			
		case .auth:
			self.appNavigation.authScreen();
		case .tab:
			self.appNavigation.loadingScreen();
		}
	}
}
