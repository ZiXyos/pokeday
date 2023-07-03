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

struct PokemonCard: View {
	
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
		ZStack() {
			ZStack() {
				Rectangle()
					.foregroundColor(.clear)
					.frame(width: 126, height: 102)
					.background(Color(red: 1, green: 0.62, blue: 0.33))
					.cornerRadius(15)
					.offset(x: 0, y: 0)
				HStack(spacing: 0) {
			
				}
		.padding(
		  EdgeInsets(top: 0, leading: 11.75, bottom: 0, trailing: 11.81)
		)
		.frame(width: 94, height: 94)
		.offset(x: 0, y: 0)
		HStack(spacing: 0) {
		  Rectangle()
			.foregroundColor(.clear)
			.frame(width: 94, height: 94)
			.background(
				AsyncImage(url: self.thumb)
			)
		}
		.frame(width: 94, height: 94)
		.offset(x: 0, y: 0)
	  }
	  .frame(width: 126, height: 102)
	  .offset(x: 101, y: 0)
	  VStack(alignment: .leading, spacing: 4) {
		VStack(alignment: .leading, spacing: -2) {
		  Text("Nº004")
			.font(Font.custom("Poppins", size: 12).weight(.semibold))
			.foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
		  Text(name)
			.font(Font.custom("Poppins", size: 21).weight(.semibold))
			.foregroundColor(.black)
		}
		  HStack {
			  ForEach(self.type, id: \.self) { item in
				  PillsTypeButtonS(type: item)
			  }
		  }
	  }
	  .offset(x: -78.50, y: 0.06)
	  ZStack() {
		Ellipse()
		  .foregroundColor(.clear)
		  .frame(width: 32, height: 32)
		  .overlay(
			Ellipse()
			  .inset(by: 0.75)
			  .stroke(.white, lineWidth: 0.75)
		  )
		  .offset(x: 0, y: 0)
		HStack(spacing: 0) {
			Image(systemName: "heart").colorInvert();
		}
		.padding(
		  EdgeInsets(top: 2, leading: 1.03, bottom: 1.85, trailing: 1.03)
		)
		.frame(width: 16, height: 16)
		.offset(x: 0, y: 0)
	  }
	  .frame(width: 32, height: 32)
	  .offset(x: 142, y: -29)
	}
	.frame(width: 328, height: 102)
	.background(Color(red: 0.99, green: 0.95, blue: 0.92))
	.cornerRadius(15);
  }
}

struct CardComponentPreview: PreviewProvider {
	static var previews: some View {
		HStack {
			PokemonCard(
				name: "charizard",
				type: ["fire", "fly"],
				thumb: URL(
					string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
				)!
			);
		}
	}
}

