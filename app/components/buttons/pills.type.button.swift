//
//  pills.button.swift
//  pokeday
//
//  Created by Ktchoumh on 4/26/23.
//

import SwiftUI

struct PillsTypeButton: View {
	
	@State var typeIcon: TypeIcons = .GRASS;
	@State var type: String;
	
	init(type: String) {
		self.type = type;
	}
	
    var body: some View {
		
		HStack(spacing: 8) {
			ZStack {
				Ellipse()
				.fill(Color.white)
				.frame(width: 28, height: 28)
				Image(
					uiImage: getImage(
						name: "leaf_icon_full"
					)!
				).resizable()
				.frame(width: 18, height: 18)
			}
			.frame(width: 28, height: 28)

			Text(self.type).fontWeight(.medium)
			.font(.subheadline)
		}.padding(.horizontal, 14)
		.padding(.vertical, 4)
		.background(Color(red: 0.39, green: 0.74, blue: 0.35))
		.cornerRadius(67)
    }
}
struct PillsTypeButtonS: View {
	
	@State var typeIcon: TypeIcons = .GRASS;
	@State var type: String;
	
	init(type: String) {
		self.type = type;
	}
	
	var body: some View {
		
		HStack(spacing: 8) {
			ZStack {
				Ellipse()
				.fill(Color.white)
				.frame(width: 28/2, height: 28/2)
				Image(
					uiImage: getImage(
						name: "leaf_icon_full"
					)!
				).resizable()
				.frame(width: 18/2, height: 18/2)
			}
			.frame(width: 28/2, height: 28/2)

			Text(self.type).fontWeight(.medium)
			.font(.subheadline)
		}.padding(.horizontal, 14/2)
		.padding(.vertical, 4/2)
		.background(Color(red: 0.39, green: 0.74, blue: 0.35))
		.cornerRadius(67)
	}
}

struct pills_button_Previews: PreviewProvider {
    static var previews: some View {
		HStack {
			PillsTypeButtonS(type: "Grass");
		}
    }
}
