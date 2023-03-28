//
//  pokedex.view.swift
//  pokeday
//
//  Created by Ktchoumh on 3/23/23.
//

import SwiftUI

struct PokedexView: View {
	
	private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
	private let viewModel: PokedexViewModel;

	public init(viewModel: PokedexViewModel) {
		self.viewModel = viewModel;
	}
	
	var body: some View {
		VStack {
			NavigationView {
				ScrollView {
					LazyVGrid(
						columns: gridItems,
						spacing: 25,
						content: {
							ForEach(1..<100) { v in
								CardComponent(
									name: "Charizard",
									type: ["type1", "type2"],
									thumb: URL(
										string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
									)!
								)
							}
						}
					)
				}
			}.task {
				do {
					try await self.viewModel.fetchAllPokemons();
				} catch {
					print("[ERROR]: \(error)");
				}
			}
		}
	}
}

struct pokedex_view_Previews: PreviewProvider {

    static var previews: some View {
		PokedexView(
			viewModel: PokedexViewModel(
				services: AppState(
					pokeSdkClient: PokeSdkClient(
						clientOptions: ClientOptions()
					)
				)
			)
		);
    }
}
