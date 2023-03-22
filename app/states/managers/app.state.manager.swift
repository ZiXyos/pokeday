//
//  app.state.manager.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

enum UserDefaultsKeys: String {
	
	case isAuth
	case token
	
	func defaultKey() -> String {
		return self.rawValue;
	}
}

protocol AppStateManager_P {
	
	func getDefault(_ key: UserDefaultsKeys) -> Bool;
	func setDefault(_ key: UserDefaultsKeys, value: Bool);

	func getDefault(_ key: UserDefaultsKeys) -> String?;
	func setDefault(_ key: UserDefaultsKeys, value: String);
}

struct AppStateManager: AppStateManager_P {
	
	func getDefault(_ key: UserDefaultsKeys) -> Bool {
		return UserDefaults.standard.bool(forKey: key.defaultKey());
	}
	
	func setDefault(_ key: UserDefaultsKeys, value: Bool) {
		UserDefaults.standard.set(value, forKey: key.defaultKey());
	}
	
	func getDefault(_ key: UserDefaultsKeys) -> String? {
		return UserDefaults.standard.string(forKey: key.defaultKey());
	}
	
	func setDefault(_ key: UserDefaultsKeys, value: String) {
		UserDefaults.standard.set(value, forKey: key.defaultKey());
	}
}
