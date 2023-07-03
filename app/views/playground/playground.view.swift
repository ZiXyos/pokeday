//
//  playground.view.swift
//  pokeday
//
//  Created by Ktchoumh on 6/3/23.
//

import Foundation
import SwiftUI;

struct PlaygroundView: View {
	
	var body: some View {
		GeometryReader { proxy in
			ZStack(alignment: .center) {
				Color.blue;
				//AsyncImage(url: <#T##URL?#>)
				VStack(alignment: .trailing) {
					Spacer();
					Image(uiImage: getImage(name: "pokeball")!).resizable()
						.frame(width: 75, height: 75).padding([.bottom], 100)
				}
			}
		}.edgesIgnoringSafeArea(.all)
	}
}
