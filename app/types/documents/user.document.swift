//
//  user.document.swift
//  pokeday
//
//  Created by Ktchoumh on 5/10/23.
//

import Foundation

struct UserDocument: Codable {
	
	var uuid: String;
	var account: String;
	var username: String;
	var exp: Int64;
	var level: Int16;
	
	init(
		uuid: String = "",
		account: String = "",
		username: String = "",
		exp: Int64 = 0,
		level: Int16 = 1
	) {
		self.uuid = uuid
		self.account = account
		self.username = username
		self.exp = exp
		self.level = level
	}
}
