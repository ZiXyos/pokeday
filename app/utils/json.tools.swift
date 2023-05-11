//
//  json.tools.swift
//  pokeday
//
//  Created by Ktchoumh on 5/10/23.
//

import Foundation

struct JSON {
	
	static let encoder = JSONEncoder();
}

extension Encodable {
	
	var dictionary: [String: Any] {
		return (try? JSONSerialization.jsonObject(
			with: JSON.encoder.encode(self)
		)) as? [String : Any] ?? [:];
	}

	subscript(key: String) -> Any? {
		
		return dictionary[key];
	}
}
