//
//  fire.elipse.swift
//  pokeday
//
//  Created by Ktchoumh on 6/29/23.
//

import SwiftUI

struct TypeElipse: View {
	private var leafColors = [
			Color(red: 0.39, green: 0.74, blue: 0.35),
			Color(red: 0.39, green: 0.74, blue: 0.35).opacity(0.50)
	];
		var body: some View {
			Ellipse().fill(
				LinearGradient(
					gradient: Gradient(
						colors: leafColors
					),
					startPoint: .topLeading,
					endPoint: .bottomTrailing
				)
			)
			  .frame(width: 498, height: 498)
			  
		}
}

struct fire_elipse_Previews: PreviewProvider {
    static var previews: some View {
		TypeElipse();
    }
}
