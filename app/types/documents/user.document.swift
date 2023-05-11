//
//  user.document.swift
//  pokeday
//
//  Created by Ktchoumh on 5/10/23.
//

import Foundation

struct UserDocument: Codable {
	
	let uuid: String;
	let account: String;
	let username: String;
	let exp: Int64;
	let level: Int16;
}
