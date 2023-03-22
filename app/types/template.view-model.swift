//
//  template.view-model.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation
import Combine

open class TemplateViewModel<T> {
	
	public var services: T;
	public init(services: T) {
		
		self.services = services;
	}
}
