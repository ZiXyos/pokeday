//
//  pokedex.view.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import SwiftUI

struct PokedexView: View {
	
	private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
	
	var body: some View {
		
		VStack {
			NavigationView {
				ScrollView {
					Text("Pokedex").bold()
					LazyVGrid(
						columns: gridItems,
						spacing: 25,
						content: {
							ForEach(0..<151) { _ in
								CardComponent()
							}
						}
					)
				}
			}
		}
	}
}

struct pokedex_view_Previews: PreviewProvider {
    static var previews: some View {
		PokedexView();
    }
}
