//
//  card-text.component.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import Foundation
import SwiftUI;

struct CardTitleText: View {
	
	let data: String;
	public init(data: String) {
		self.data = data
	}
	
	var body: some View {
		
			Text(data)
				.font(.headline)
				.foregroundColor(.white)
				.bold()
				.padding([.top], 15)
				.padding(.leading)
		}
}

struct CardTypeText: View {
	
	let data: String;
	public init(data: String) {
		self.data = data;
	}
	
	var body: some View {
		
		Text(data)
			.font(.subheadline).bold()
			.foregroundColor(.white)
			.padding(.horizontal, 16)
			.padding(.vertical, 4)
			.overlay(
				content: {
					RoundedRectangle(cornerRadius: 15)
						.fill(Color.white.opacity(0.25)
					)
				}
			).frame(width: 100.0, height: 24)
		.italic()
	}
}

struct CardTitleText_Previews: PreviewProvider {
	static var previews: some View {
		CardTitleText(data: "Fire").background(Color.red);
	}
}
