//
//  pokemon.view.swift
//  pokeday
//
//  Created by Ktchoumh on 4/19/23.
//

import SwiftUI;

struct Header: View {
	@State var isShowed: Bool = true;
	@State var type: String = "";
	
	var body: some View {
		
		ZStack() {
			TypeElipse();
			HStack(spacing: 246) {
				
				HStack(spacing: 0) {
				  ZStack() { Text("Next")}
				  .frame(width: 38, height: 38)
				}
				.frame(width: 38, height: 38)
				.cornerRadius(5)
				HStack(spacing: 0) {Text("Prev");}
				.padding(
				  EdgeInsets(top: 3.50, leading: 1.81, bottom: 3.23, trailing: 1.81)
				)
				.frame(width: 28, height: 28)
		  }
		  HStack(spacing: 0) {
			  Image(uiImage: getImage(name: "leaf_icon_unfull")!)
		  }
		  .padding(
			EdgeInsets(top: 4.16, leading: 9.64, bottom: 3.34, trailing: 12.60)
		  )
		  .frame(width: 204, height: 204)
		  Rectangle()
			.foregroundColor(.clear)
			.frame(width: 142.23, height: 154.87)
			.background(
				AsyncImage(
					url: URL(
						string:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
					)!
				) { img in
					img.image?.resizable().imageScale(.large)
				}
			)
		}.frame(width:360, height: 307)
	}
}

struct PokemonView: View {

	var body: some View {
		VStack(spacing: 18) {
			Section(header: Header().offset(y: -498 / 1.5) ) {
				VStack(alignment: .leading, spacing: 24) {
					VStack(alignment: .leading, spacing: -5) {
						Text("Bulbasaur")
							.font(Font.custom("Poppins", size: 32).weight(.medium))
							.foregroundColor(.black)
						Text("Nº001")
							.font(Font.custom("Poppins", size: 16).weight(.medium))
							.foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.70))
					}
					HStack {
						PillsTypeButton(type: "Grass")
						PillsTypeButton(type: "Poison")
					}
				}
			}
		}
	}
}

struct pokemon_view_Previews: PreviewProvider {

	static var previews: some View {
		PokemonView();
	}
}
