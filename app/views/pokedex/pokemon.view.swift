//
//  pokemon.view.swift
//  pokeday
//
//  Created by Ktchoumh on 4/19/23.
//

import SwiftUI;

struct PokemonView: View {
	
	@State var isShowed = true;

	var body: some View {

		VStack(alignment: .center) {
			HStack {
				VStack {
					Text("Charizard");
					HStack {
						Text("fire");
						Text("fly");
					}
				}
				Spacer();
				VStack {
					Text("#001");
					Text("Gen 1");
				}
			}
			
			Spacer()
			ZStack(alignment: .top) {
				AsyncImage(
					url: URL(
						string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
					)!
				) { image in
					image.image?.resizable()
						.frame(width: 150, height: 150)
				}
			}
			Text("simple test")
			Text("simple test 2")
			Text("simple test")
		}
	}
	
}

struct pokemon_view_Previews: PreviewProvider {

	static var previews: some View {
		PokemonView().background(Color.red);
	}
}
