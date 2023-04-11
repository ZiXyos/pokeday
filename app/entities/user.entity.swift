//
//  user.entity.swift
//  pokeday
//
//  Created by Ktchoumh on 3/29/23.
//

import Foundation;
import CoreData;

public final class UserEntity: NSManagedObject {

	@NSManaged var uuid: NSUUID;
	@NSManaged var name: String;
	@NSManaged var level: Int;
}
