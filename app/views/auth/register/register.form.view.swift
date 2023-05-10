//
//  register.form.view.swift
//  pokeday
//
//  Created by Ktchoumh on 5/10/23.
//

import SwiftUI

struct RegisterFormView: View {
	
	@State var email: String = "";
	@State var password: String = "";

    var body: some View {
		VStack(spacing: 20) {
			Text("Create Account")
			.fontWeight(.semibold)
			.font(.title3)
			
			AsyncImage(
				url: URL(
					string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png"
				)!
			) { image in
				image.image?.resizable()
					.frame(width: 150, height: 150)
					.blur(radius: 0)
					.shadow(radius: 30)
			}

			VStack(spacing: 0) {
					Text("Let's start!")
					.font(.title)
					.padding(.bottom, 20)
				
				

					Text("What is your e-mail")
					.fontWeight(.semibold)
					.font(.title2)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			TextField("E-mail", text: $email)
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

			Text("What is your Password")
				.fontWeight(.semibold)
			.font(.title2)
			.frame(maxWidth: .infinity, alignment: .leading)
			
			SecureField("Password", text: self.$email)
				.keyboardType(.emailAddress)
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
			
			Text("Confirm your Password")
			.fontWeight(.semibold)
			.font(.title2)
			.frame(maxWidth: .infinity, alignment: .leading)
			
			SecureField("Password", text: self.$password)
				.keyboardType(.emailAddress)
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
				
			Spacer();

			Text("Continue")
			.fontWeight(.semibold)
			.font(.title3)
			.padding([.horizontal], 10)
			.frame(width: 328, height: 58)
			.frame(maxWidth: .infinity, minHeight: 48)
			.background(Color(red: 0.90, green: 0.90, blue: 0.90))
			.cornerRadius(50)
			
		}
		.padding(.bottom, 20)
		.padding(.top, 46)
		.frame(width: 360, height: 800)
		.background(Color.white)
    }
}

struct register_form_view_Previews: PreviewProvider {
    static var previews: some View {
		RegisterFormView();
    }
}
