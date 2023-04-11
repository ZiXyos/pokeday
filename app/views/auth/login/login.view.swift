//
//  login.view.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import SwiftUI

struct LoginView: View {
	
	@StateObject var viewModel: LoginViewModel
	
	@State var username: String = "";
	@State var password: String = "";
	
    var body: some View {
		VStack {
			Text("This is the login page");
			TextField("Username", text: self.$username)
				.padding()
				.background(Color.gray)
				.cornerRadius(5.0)
				.padding(.bottom, 20)
	
			SecureField("Password", text: self.$password)
				.padding()
				.background(Color.gray)
				.cornerRadius(5.0)
				.padding(.bottom, 20)
			
			Button("Login") {
				self.viewModel.loginWithUsername(
					username: self.username,
					password: self.password
				)
			}
		}
    }
}

struct login_view_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
			viewModel: LoginViewModel(services: AppState(
				pokeSdkClient: PokeSdkClient(
					clientOptions: ClientOptions()
				)
			))
		);
    }
}
