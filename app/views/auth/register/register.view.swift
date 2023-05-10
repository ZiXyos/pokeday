//
//  register.view.swift
//  pokeday
//
//  Created by Ktchoumh on 5/10/23.
//

import SwiftUI

struct register_view: View {

    var body: some View {
		VStack() {
			Text("Register")
				.fontWeight(.semibold)
				.font(.title)
			Spacer()

			ZStack {
				AsyncImage(
					url: URL(
						string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
					)!
				) { image in
					image.image?.resizable()
						.frame(width: 300, height: 300)
						.blur(radius: 0)
						.shadow(radius: 30)
				}
			}
			
			Spacer();

			VStack(alignment: .leading, spacing: 32) {
					VStack() {
						Text("New Dressor!")
						.fontWeight(.medium)
						.font(.title)
						.multilineTextAlignment(.center)
						.frame(width: 326, alignment: .top)

						Text("Just Fight Foo Bar eheh i don't know")
						.font(.subheadline)
						.multilineTextAlignment(.center)
						.frame(width: 320, alignment: .top)
						.lineSpacing(21)
					}

				VStack(alignment: .leading, spacing: 12) {
					HStack(spacing: 22) {
						Image(systemName: "apple.logo").resizable()
						.frame(width: 21.33, height: 26.26)

						Text("Register With Apple")
						.fontWeight(.semibold)
						.font(.callout)
					}.padding(.horizontal, 32)
					.padding(.vertical, 10)
					.frame(width: 328, height: 58)
					.cornerRadius(50)
					.overlay(RoundedRectangle(cornerRadius: 50).stroke(Color(red: 0.86, green: 0.86, blue: 0.87), lineWidth: 2))

					HStack(spacing: 22) {
						Image(uiImage: getImage(name: "google_icon")!).resizable()
						.frame(width: 27.16, height: 27.16)

						Text("Register with google")
						.fontWeight(.semibold)
						.font(.callout)
					}.padding(.horizontal, 32)
					.padding(.vertical, 10)
					.frame(width: 328, height: 58)
					.cornerRadius(50)
					.overlay(RoundedRectangle(cornerRadius: 50).stroke(Color(red: 0.86, green: 0.86, blue: 0.87), lineWidth: 2))

					Text("Signup with E-Mail")
						.fontWeight(.semibold)
						.font(.callout)
						.padding(.horizontal, 8)
						.padding(.vertical, 10)
						.frame(width: 328, height: 58)
						.background(Color(red: 0.09, green: 0.24, blue: 0.65))
						.cornerRadius(50)
						.overlay(RoundedRectangle(cornerRadius: 50).stroke(
							Color(
								red: 0.09,
								green: 0.24,
								blue: 0.65
							),
							lineWidth: 2)
						)
				}
			}
		}
    }
}

struct register_view_Previews: PreviewProvider {
    static var previews: some View {
        register_view()
    }
}
