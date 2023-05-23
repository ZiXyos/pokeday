//
//  cache.tools.swift
//  pokeday
//
//  Created by Ktchoumh on 5/11/23.
//

import Foundation

final class CacheEntry<T> {
	
	let dateCreated: Date;
	let expirationDate: Date?;
	let size: Int;
	let status: CacheStatus;
	private var value: T;
	let key: String;
	
	init(
		status: CacheStatus,
		dateCreated: Date = Date(),
		expirationDate: Date? = nil,
		size: Int = 0,
		value: T,
		key: String
	) {
		self.status = status;
		self.dateCreated = dateCreated;
		self.expirationDate = expirationDate;
		self.size = size;
		self.value = value;
		self.key = key;
	}
	
	var description: String {
		return "CacheEntry(value: \(self.value), dateCreated: \(dateCreated), expirationDate: \(String(describing: expirationDate)), size: \(size), status: \(status))"
	}
	
	var debugDescription: String {
		return "CacheEntry(key: \(self.key), value: \(value), dateCreated: \(dateCreated), expirationDate: \(String(describing: expirationDate)), size: \(size), status: \(status))"
	  }
	
	public func getData() -> T { return self.value; }
	public func editValue(newValue: T) { self.value = newValue; }
}

enum CacheStatus {
	case inProgress(Task<Any, Error>)
	case ready(Any);
}

extension NSCache where KeyType == NSString, ObjectType == CacheEntry<Pokemon_s> {
	
	subscript(key: String) -> CacheEntry<Pokemon_s>? {
		  get {
			  return self.object(forKey: key as NSString)
		  }
		  set {
			if let newValue = newValue {
				self.setObject(newValue, forKey: key as NSString)
			} else {
				self.removeObject(forKey: key as NSString)
			}
		}
	}
}

extension NSCache where KeyType == NSString, ObjectType == CacheEntry<UserDocument> {
	
	subscript(key: String) -> CacheEntry<UserDocument>? {
		  get {
			  return self.object(forKey: key as NSString)
		  }
		  set {
			if let newValue = newValue {
				self.setObject(newValue, forKey: key as NSString)
			} else {
				self.removeObject(forKey: key as NSString)
			}
		}
	}
}
