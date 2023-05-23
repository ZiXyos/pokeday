//
//  pokedex.card.component.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import Foundation;
import SwiftUI;

struct CardComponent: View {

	let name: String;
	let type: [String];
	let thumb: URL;

	init(name: String, type: [String], thumb: URL) {
		print("[LOG]: INIT -> Card");
		self.name = name
		self.type = type
		self.thumb = thumb
	}
	var body: some View {
		ZStack {
			
			VStack(alignment: .leading, spacing: 16.0) {
				
				CardTitleText(data: self.name)

				HStack {
					VStack {
						ForEach(self.type, id: \.self) { str in
							CardTypeText(data: str)
						}
					}
	
					AsyncImage(url: self.thumb) { image in
						image.image?.resizable()
							.padding([.bottom, .trailing], 4)
					}
					.frame(width: 68, height: 68)
						.scaledToFit()
						.shadow(radius: 3)
				}
			}
		}.background(Color.green)
			.cornerRadius(12)
			.shadow(radius: 8)
			.frame(width: 100, height: 100)
	}
}

struct CardComponentPreview: PreviewProvider {
	static var previews: some View {
		HStack {
			CardComponent(
				name: "charizard",
				type: ["fire", "fly"],
				thumb: URL(
					string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
				)!
			)
		}
	}
}

