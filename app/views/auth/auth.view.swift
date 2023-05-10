//
//  auth.view.swift
//  pokeday
//
//  Created by Ktchoumh on 5/11/23.
//

import SwiftUI;

protocol AuthNavView: AnyObject {
	func registerViewNavigation() -> RegisterView;
	func loginViewNavigation() -> LoginView;
}

struct AuthView: View {
	
	@State var nav: AuthNavView?;

    var body: some View {
	
		VStack(spacing: 66.45) {
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
			}.frame(width: 198, height: 255.10)
			.frame(maxWidth: .infinity, maxHeight: 272.10)

			VStack(spacing: 32) {
				VStack() {
					Text("Are you ready for this adventure?")
					.fontWeight(.medium)
					.font(.title)
					.multilineTextAlignment(.center)
					.frame(width: 321, alignment: .top)

					Text("Be Ready to to capture each day ")
					.font(.subheadline)
					.multilineTextAlignment(.center)
					.frame(width: 320, alignment: .top)
					.lineSpacing(21)
				}

				VStack(alignment: .leading, spacing: 4) {
					
					NavigationLink(destination: self.nav?.registerViewNavigation()) {
						Text("Create Account")
							.foregroundColor(Color.white)
							.font(.title3)
					}.fontWeight(.semibold)
						.padding(.horizontal, 8)
						.padding(.vertical, 10)
						.frame(width: 328, height: 58)
						.background(Color(red: 0.09, green: 0.24, blue: 0.65))
						.cornerRadius(50)
					
					NavigationLink(destination: self.nav?.loginViewNavigation()) {
						Text("Login").fontWeight(.semibold)
							.foregroundColor(Color.black)
							.font(.title3)
							
					}.padding(.horizontal, 8)
						.padding(.vertical, 10)
						.frame(width: 328, height: 58)
						.cornerRadius(50)
				}
			}
		}
    }
}

struct auth_view_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
