//
//  profil.view.model.swift
//  pokeday
//
//  Created by Ktchoumh on 5/24/23.
//

import Foundation;

class ProfileViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	@Published var userState = UserDocument();
	
	public override init(services: StateServices_P) {
		
		super.init(services: services);
		guard let token: String = self.services.authState.usertoken else {
			fatalError(
				AppStateError.tokenNotFound.localizedDescription
			);
		}
		
		let user = self.services.userCache.object(
			forKey: NSString(string: token)
		);

		self.userState = user?.getData() ?? UserDocument();
	}
	
	public func getUserName() -> String {
		return self.userState.username;
	}
	
	
	public func logout() -> Void {
		guard let token: String =
		self.services.appManager.getDefault(.token) else {
			fatalError(AppStateError.tokenNotFound.localizedDescription);
		}
		self.services.userCache.removeObject(forKey: token as NSString);
		self.services.authManager.logout();
	}
}
