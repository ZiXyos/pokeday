//
//  pokedex.card.component.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import Foundation;
import SwiftUI;

struct CardComponent: View {
	
	
	
	let localUrl = URL(
		string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png"
	);
	
	let pokeData: Pokemon = Pokemon(
		id: 6,
		name: "Charizard",
		base_experience: 50,
		height: 120,
		is_default: true,
		order: true,
		weight: 140,
		abilities: [
			PokemonAbility(
				id: 1,
				name: "Fire bolt",
				is_main_series: true)
		],
		forms: [""],
		type: ["Fire", "Fly"]
	);

	/*public init(pokeData: Pokemon) {
		self.pokeData = pokeData
	}*/

	var body: some View {
		ZStack {
			
			VStack(alignment: .leading, spacing: 16.0) {
				
				CardTitleText(data: pokeData.name)

				HStack {
					VStack {
						ForEach(pokeData.type, id: \.self) { str in
								CardTypeText(data: str)
						}
					}
	
					AsyncImage(url: localUrl) { image in
						image.image?.resizable()
							.padding([.bottom, .trailing], 4)
					}.frame(width: 68, height: 68)
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
			CardComponent()
		}
		
	}
}

