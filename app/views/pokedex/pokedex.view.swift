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
		print("[LOG::REGION:ENABLED]: \(self.viewModel.pkms.keys)");
	}
	
	var body: some View {
		VStack {
			NavigationView {
				if let pkms = self.viewModel.pkms[1] {
					ScrollView {
						LazyVGrid(
							columns: gridItems,
							spacing: 25,
							content: {
								ForEach(pkms, id: \.id) { v in
									CardComponent(
										name: v.name,
										type: v.type,
										thumb: URL(
											string: v.sprites.front_default
										)!
									)
								}
							}
						)
					}
				} else {
					Text("LOADING")
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
