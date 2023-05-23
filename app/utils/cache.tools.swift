//
//  cache.tools.swift
//  pokeday
//
//  Created by Ktchoumh on 5/11/23.
//

import Foundation

final class CacheEntry<T: Encodable>: Encodable {
	
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
	
	func encode(to encoder: Encoder) throws {
		   var container = encoder.container(keyedBy: CodingKeys.self)

		   try container.encode(key, forKey: .key)
		   try container.encode(value, forKey: .value)
	   }

	   enum CodingKeys: String, CodingKey {
		   case key
		   case value
	   }
}


extension CacheEntry where T: Codable {

	func saveToDisk(
		withName name: String,
		using fManager: FileManager = .default
	) {
		
		let folderURLs = fManager.urls(
			for: .cachesDirectory,
			in: .userDomainMask
		);
	
		let fileURL = folderURLs[0].appendingPathComponent("\(name).cache");
		do {
			let data = try JSONEncoder().encode(self.getData());
			try data.write(to: fileURL);
		} catch let error {
			print(error.localizedDescription);
			return;
		}
	}
	
	
	func getOnDiskValue(
		withName fname: String,
		using fManager: FileManager = .default
	) -> Result<T, CacheError<T>> {
		
		let folderURLs = fManager.urls(
			for: .cachesDirectory,
			in: .userDomainMask
		);
		
		do {
			let data = try Data(
				contentsOf: folderURLs[0].appendingPathComponent(
					"\(fname).cache"
				)
			);
			
			let res = try JSONDecoder().decode(
				T.self,
				from: data
			);
			
			return .success(res);
		} catch let error {
			print(error.localizedDescription);
			return .failure(CacheError.emptyEntity(entityType: T.self));
		}
	}
}

enum CacheStatus {
	case inProgress(Task<Any, Error>)
	case ready(Any);
}

final class Cache<K: NSString, T: CacheEntry<V>, V: Encodable> {
	
	private let wrapped: NSCache<NSString, CacheEntry<V>>
	private let wrappedKey: K;
	init(
		wrapped: NSCache<NSString, CacheEntry<V>>,
		wrappedKey: K
	) {
		self.wrapped = wrapped;
		self.wrappedKey = wrappedKey;
	}
	
	public func setEntity(_ entity: CacheEntry<V>) {
		
		self.wrapped.setObject(entity, forKey: self.wrappedKey);
	}
	
	public func getEntity(forKey key: K) -> Result<V, CacheError<V.Type>> {
		
		if let entry = wrapped.object(forKey: key) {
			return .success(entry.getData())
		}
		
		return .failure(
			CacheError.emptyEntity(entityType: V.Type.self)
		);
	}
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

func getCacheOnDiskValue<T: Codable>(
	withName fname: String,
	using fManager: FileManager = .default
) -> Result<T, FileError> {
	
	let folderURLs = fManager.urls(
		for: .cachesDirectory,
		in: .userDomainMask
	);
	
	do {
		let data = try Data(
			contentsOf: folderURLs[0].appendingPathComponent(
				"\(fname).cache"
			)
		);
		
		let res = try JSONDecoder().decode(
			T.self,
			from: data
		);
		
		return .success(res);
	} catch let error {
		print(error.localizedDescription);
		return .failure(FileError.fileDoNotExist(fname: fname));
	}
}
