//
//  pills.pokemon.button.swift
//  pokeday
//
//  Created by Ktchoumh on 4/26/23.
//

import SwiftUI

struct PillsPokemonButton: View {
	
	@State var pokemonName: String = "Charizard";
	
    var body: some View {
		HStack(spacing: 12) {
			ZStack {
				
				Image(uiImage: getImage(name: "leaf_icon_unfull")!)
					.resizable()
					.frame(width: 65, height: 65)
					.padding(.horizontal, 15)
					.padding(.top, 4)
					.padding(.bottom, 5)
					.frame(width: 95, height: 74)
					.background(Color(red: 0.39, green: 0.74, blue: 0.35))
					.cornerRadius(71)

				AsyncImage(
					url: URL(
						string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
						)
				) { image in
					image.image?.resizable()
						.frame(width: 80, height: 80)
					
				}
			}
			.frame(width: 96, height: 74)

			VStack(alignment: .leading, spacing: 4) {
				VStack(alignment: .leading, spacing: -2) {
					Text(self.pokemonName)
							.fontWeight(.medium)
							.font(.callout)

							Text("Nº001")
							.fontWeight(.medium)
							.font(.caption)
							.frame(width: 60, height: 17, alignment: .topLeading)
				}

				HStack(alignment: .top, spacing: 4) {
					ZStack {
						RoundedRectangle(cornerRadius: 8)
							.fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
							.frame(width: 10, height: 10)
							.padding(.horizontal, 23)
							.padding(.vertical, 3)
							.frame(width: 68, height: 13)
							.background(Color(red: 0.39, green: 0.74, blue: 0.35))
							.cornerRadius(20)
					}
					
					ZStack {
						Ellipse()
							.fill(Color.white)
							.frame(width: 28, height: 28)
						Image(
							uiImage: getImage(
								name: "leaf_icon_full"
							)!
						).resizable().frame(width: 10, height: 10)
						
					}.background(Color(red: 0.39, green: 0.74, blue: 0.35))
							.cornerRadius(20)
					
					/*.frame(width: 10, height: 10)
					.padding(.horizontal, 23)
					.padding(.vertical, 3)
					.frame(width: 68, height: 13)
					.cornerRadius(20)*/
				}
			}
		}
		.padding(.vertical, 1)
		.padding(.trailing, 48)
		.frame(width: 296, height: 76)
		.cornerRadius(90)
		.overlay(RoundedRectangle(cornerRadius: 90).stroke(Color(red: 0.90, green: 0.90, blue: 0.90), lineWidth: 1))
    }
}

struct pills_pokemon_button_Previews: PreviewProvider {
    static var previews: some View {
		PillsPokemonButton();
    }
}
