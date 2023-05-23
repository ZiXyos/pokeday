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
	case load
}

class AppNavigation: ObservableObject {
	
	@Published var screen: AppNavigationScreen = .auth;
	private var anyCancellable = Set<AnyCancellable>();
	private var appCache: NSCache<NSString, CacheEntry<String>> = NSCache();
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
	
		let res = self.getUser();
		switch res {
			case .success(let user):
				self.storePersistentUser(user: user);
			case .failure(_):
				break;
		}
		   self.appServices.authManager.authState.$isLogged.sink {
			   
			   [weak self] (value) in
			   
			   if value == true {
				   
				   self?.screen = .load;
			   } else {
				   self?.screen = .auth;
			   }
		   }.store(in: &self.anyCancellable)
	   }
	
	public func setBinding(bind: AppNavigationScreen) {
		self.screen = bind;
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

extension AppNavigation {

	func getUser() -> Result<UserDocument, FileError> {
		return getCacheOnDiskValue(withName: "user")
	}
	
	func storePersistentUser(user: UserDocument) -> Void {
		let cachedItem = CacheEntry<UserDocument>(
			status: .ready(user),
			value: user,
			key: String(describing: user.uuid)
		);
		self.appServices.userCache.setObject(cachedItem, forKey: user.uuid as NSString);
		self.appServices.authManager.authState.isLogged.toggle();
		self.appServices.appManager.setDefault(
			.isAuth,
			value: self.appServices.authManager.authState.isLogged
		);
	}
}

public struct AppNavigationView: View {
	
	@StateObject var appNavigation: AppNavigation;
	
	public var body: some View {
		
		switch self.appNavigation.screen {
			
		case .auth:
			self.appNavigation.authScreen();
		case .load:
			self.appNavigation.loadingScreen();
		case .tab:
			self.appNavigation.tabScreen();
		}
	}
}
