//
//  ui.tools.swift
//  pokeday
//
//  Created by Ktchoumh on 4/24/23.
//

import SwiftUI

public func getImage(name: String, ext: String = "png") -> UIImage? {
	
	guard let path = Bundle.main.path(
		forResource: name,
		ofType: ext
	) else {
		return nil;
	}
	
	return UIImage(contentsOfFile: path);
}
