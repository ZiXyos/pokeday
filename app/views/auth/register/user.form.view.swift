//
//  user.form.view.swift
//  pokeday
//
//  Created by Ktchoumh on 5/10/23.
//

import SwiftUI;

struct UserFormView: View {
	
	@State var username: String = "";

	var body: some View {
		
		VStack {
		
			VStack(spacing: 4) {

				Text("Who are You ?")
				.fontWeight(.semibold)
				.font(.title)
				
				Text("Last Step")
				.font(.title2)

			}

			HStack(spacing: 0) {
				TextField("Username", text: $username)
					.keyboardType(.default)
					.padding(.vertical, 14)
					.padding(.leading, 16)
					.padding(.trailing, 259)
					.frame(width: 350, height: 52)
					.cornerRadius(5)
					.overlay(
						RoundedRectangle(
							cornerRadius: 5
						).stroke(
							Color(
								red: 0.60,
								green: 0.60,
								blue: 0.60
							),
							lineWidth: 1.50
						)
					);
			}

			Text("This will be your playername visible by other player")
			.font(.caption)
			
			VStack {
				Text("Chose Your Trainer").font(.title).fontWeight(.semibold)
				HStack(spacing: 10) {
					
					VStack(spacing: 2) {
						AsyncImage(
							url: URL(
								string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
							)!
						) { image in
							image.image?.resizable()
								.frame(width: 100, height: 100)
								.blur(radius: 0)
								.shadow(radius: 30)
						}
						
						Text("M").font(.title2)
					}
					
					VStack(spacing: 2) {
						AsyncImage(
							url: URL(
								string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
							)!
						) { image in
							image.image?.resizable()
								.frame(width: 100, height: 100)
								.blur(radius: 0)
								.shadow(radius: 30)
						}
						
						Text("F").font(.title2);
					}
				}
			}.padding(.top, 50)
			
			Spacer();
			
			Text("Finish")
			.fontWeight(.semibold)
			.font(.title3)
			.padding(.horizontal, 8)
			.padding(.vertical, 10)
			.frame(width: 328, height: 58)
			.background(Color(red: 0.90, green: 0.90, blue: 0.90))
			.cornerRadius(50)
		}
	}
}

struct user_form_view_Previews: PreviewProvider {
    static var previews: some View {
        UserFormView()
    }
}
