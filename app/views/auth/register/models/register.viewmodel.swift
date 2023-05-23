//
//  register.viewmodel.swift
//  pokeday
//
//  Created by Ktchoumh on 5/11/23.
//

import Foundation;
import FirebaseAuth;

class RegisterViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	let appCache: NSCache<NSString, CacheEntry<String>> = NSCache();

	override init(services: StateServices_P) {
		
		super.init(services: services);
	}
	
	public func createAccount(
		email: String,
		password: String
	) -> Void {
		
		Auth.auth().createUser(
			withEmail: email,
			password: password
		) { [weak self] authResult, error in
			guard let strongSelf = self else {
				print(FireBaseRegisterError.unknown);
				return;
			}
			
			guard let userResult = authResult?.user else {

				print("\(String(describing: authResult))")
				print(FireBaseRegisterError.userAlreadyExist(username: email));
				return
			}
			print("[LOG::RegisterViewModel::createAccount]: \(userResult.uid)")
			let cachedItem = CacheEntry<String>(
				status: .ready(userResult.uid),
				value: userResult.uid,
				key: "user-id:\(userResult.uid)"
			);
			
			strongSelf.appCache.setObject(cachedItem, forKey: "uuid");
			strongSelf.services.appManager.setDefault(
				.token,
				value: userResult.uid
			);
		}
	}
}
