//
//  user.entity.swift
//  pokeday
//
//  Created by Ktchoumh on 3/29/23.
//

import Foundation;

public class UserEntity {

	var uuid: NSUUID = NSUUID();
	var account: String;
	var username: String = "";
	var exp: Int64 = 0;
	var level: Int = 1;
	
	init (accountId: String) {
		self.account = accountId;
	}
}
