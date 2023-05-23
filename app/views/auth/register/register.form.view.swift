//
//  register.form.view.swift
//  pokeday
//
//  Created by Ktchoumh on 5/10/23.
//

import SwiftUI

protocol RegisterFormNavigationView: AnyObject {
	func userFormViewNavigation() -> UserFormView;
}

struct RegisterFormView: View {
	
	@State var nav: RegisterFormNavigationView?;
	
	@State var email: String = "";
	@State var password: String = "";
	@State var confirmPass: String = "";

	@StateObject var viewModel: RegisterViewModel;

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
				.textInputAutocapitalization(.never)
				.disableAutocorrection(true)
				.padding(.vertical, 14)
				.padding(.leading, 16)
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
			
			SecureField("Password", text: self.$password)
				.keyboardType(.emailAddress)
				.textInputAutocapitalization(.never)
				.disableAutocorrection(true)
				.padding(.vertical, 14)
				.padding(.leading, 16)
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
			
			SecureField("Password", text: self.$confirmPass)
				.textInputAutocapitalization(.never)
				.disableAutocorrection(true)
				.keyboardType(.emailAddress)
				.padding(.vertical, 14)
				.padding(.leading, 16)
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

			NavigationLink(destination: self.nav?.userFormViewNavigation()) {
				Text("Continue").fontWeight(.semibold)
					.foregroundColor(Color.black)
					.font(.title3)
					
					.frame(width: 328, height: 58)
					.frame(maxWidth: .infinity, minHeight: 48)
					.background(Color(red: 0.90, green: 0.90, blue: 0.90))
					.cornerRadius(50)
			}.simultaneousGesture(TapGesture().onEnded {
				self.viewModel.createAccount(
				 email: self.email,
				 password: self.password)
		 })
			.padding(.horizontal, 8)
			.padding(.vertical, 10)
		}.padding(.bottom, 20)
		.padding(.top, 46)
		.frame(width: 360, height: 800)
    }
}

struct register_form_view_Previews: PreviewProvider {
    static var previews: some View {
		RegisterFormView(
			viewModel: RegisterViewModel(
				services: AppState(
					pokeSdkClient: PokeSdkClient(
						clientOptions: ClientOptions()
					)
				)
			)
		);
    }
}
