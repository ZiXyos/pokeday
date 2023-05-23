//
//  user.form.viewmodel.swift
//  pokeday
//
//  Created by Ktchoumh on 5/11/23.
//

import Foundation;
import FirebaseFirestore;

class UserFormViewModel: TemplateViewModel<StateServices_P>, ObservableObject {
	
	let appCache: NSCache<NSString, CacheEntry<UserDocument>>;
	override init(services: StateServices_P) {
		
		self.appCache = NSCache();
		
		super.init(services: services);
	}
	
	let db = Firestore.firestore();
	
	public func createUser(username: String) -> Void {
		
		let collections = self.db.collection("Users");
		
		guard let accountId: String =
			self.services.appManager.getDefault(.token) else {
				print(AppStateError.tokenNotFound);
				return;
			}
		
		let doc = collections.document(accountId);
		let user = UserDocument(
			uuid: NSUUID().uuidString,
			account: accountId,
			username: username,
			exp: 0,
			level: 1
		);

		doc.setData([
			accountId : user.dictionary
		]);
		let cachedItem = CacheEntry<UserDocument>(
			status: .ready(user),
			value: user,
			key: String(describing: user.uuid)
		);

		self.appCache.setObject(cachedItem, forKey: NSString(string: user.uuid));
		cachedItem.saveToDisk(withName: "user");
		self.services.authManager.login(token: user.uuid);
	}
}
