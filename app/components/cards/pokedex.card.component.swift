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

	var body: some View {
		ZStack {
			
			VStack(alignment: .leading, spacing: 16.0) {
				Text("Charizard")
					.font(.headline)
					.foregroundColor(.white)
					.bold()
					.padding([.top], 15)
					.padding(.leading)

				HStack {
					VStack {
						Text("Fire")
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
						
						Text("Fly")
							.font(.subheadline).bold()
							.foregroundColor(.white)
							.padding(.horizontal, 16)
							.padding(.vertical, 4)
							.overlay(
								content: { RoundedRectangle(cornerRadius: 15)
											.fill(Color.white.opacity(0.25)
										)
								}
							).frame(width: 100.0, height: 24)
						.italic()
					}
	
					AsyncImage(url: localUrl) { image in
						image.image?.resizable()
							.padding([.bottom, .trailing], 4)
					}.frame(width: 68, height: 68)
						.scaledToFit()
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

