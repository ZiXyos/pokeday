//
//  cache.tools.swift
//  pokeday
//
//  Created by Ktchoumh on 5/11/23.
//

import Foundation

final class CacheEntry {
	
	let entry: CacheStatus;
	init(entry: CacheStatus) { self.entry = entry }
}

enum CacheStatus {
	case inProgress(Task<Any, Error>)
	case ready(Any);
}

extension NSCache where KeyType == NSString, ObjectType == CacheEntry {
	
	subscript(_ url: String) -> CacheStatus? {
		get {
			let key = url as NSString;
			let value = object(forKey: key);
			return value?.entry;
		}
		
		set {
			let key = url as NSString;
			if let entry = newValue {
				
				let value = CacheEntry(entry: entry);
				setObject(value, forKey: key);
			} else {
				removeObject(forKey: key);
			}
		}
	}
}
