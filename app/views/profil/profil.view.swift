//
//  profil.view.swift
//  pokeday
//
//  Created by Ktchoumh on 5/24/23.
//

import SwiftUI

struct ProfileView: View {
	
	var viewModel: ProfileViewModel;
	
    var body: some View {
		VStack(spacing: 10) {
			Text(self.viewModel.getUserName())
			Button("Logout") {
				self.viewModel.logout();
			}
		}
    }
}

struct profil_view_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
			viewModel: ProfileViewModel(
				services: AppState(
					pokeSdkClient: PokeSdkClient(
						clientOptions: ClientOptions()
					)
				)
			)
		);
    }
}
