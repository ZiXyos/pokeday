//
//  ellipse.items.swift
//  pokeday
//
//  Created by Ktchoumh on 4/24/23.
//

import SwiftUI

struct PokemonHeader: View {
	
	@State var typeUrl: URL? = nil;
	
	init() {
		if let url = Bundle.main.url(
			forResource: "leaf_icon_unfull",
			withExtension: ".png"
		) {
			self.typeUrl = url;
		}
	}
	
    var body: some View {
		ZStack {
			Ellipse()
			.fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.39, green: 0.74, blue: 0.35), Color(red: 0.39, green: 0.74, blue: 0.35, opacity: 0.50)]), startPoint: .topLeading, endPoint: .bottomTrailing))
			.offset(x: 6, y: -131.50)
			.frame(width: 498, height: 498)

			Image(uiImage: getImage(name: "leaf_icon_unfull")!)
			AsyncImage(
				url: URL(
					string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
					)
			) { image in
				image.image?.resizable()
					.offset(x: -6.89, y: 67.13)
					.frame(width: 142.23, height: 154.87)
			}
		}
		.frame(width: 360, height: 307)
	}
}

public func getImage(name: String, ext: String = "png") -> UIImage? {
	
	guard let path = Bundle.main.path(
		forResource: name,
		ofType: ext
	) else {
		return nil;
	}
	
	return UIImage(contentsOfFile: path);
}

struct PokemonHeaderPreview: PreviewProvider {
    static var previews: some View {
		PokemonHeader()
    }
}
