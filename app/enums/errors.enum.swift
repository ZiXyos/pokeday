//
//  errors.enum.swift
//  pokeday
//
//  Created by Ktchoumh on 5/11/23.
//

import Foundation;

enum FireBaseRegisterError: Error {
	case invalidRequest;
	case userAlreadyExist(username: String);
	case unknown;
}

enum AppStateError: Error {
	case tokenNotFound;
}

enum CacheError<T>: Error {

	case emptyEntity(entityType: T.Type);
}

enum FileError: Error {
	case fileDoNotExist(fname: String);
	case imageDoNotExiste(imageName: String);
}
