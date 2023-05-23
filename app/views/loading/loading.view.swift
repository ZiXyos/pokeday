//
//  loading.view.swift
//  pokeday
//
//  Created by Ktchoumh on 3/28/23.
//

import SwiftUI

struct LoadingView: View {
    
	@State var isLoading = false;
	private let viewModel: LoadingViewModel;
	
	public init(viewModel: LoadingViewModel) {

		self.viewModel = viewModel;
	}
	
	var body: some View {
		if !isLoading {
			Button("TODO Loader") {
				let _ = self.viewModel.play();
			}.onAppear {
				Task {
					do {
						try await self.viewModel.getRemoteData();
						self.isLoading = true;
					} catch {
						print(error);
						fatalError(error.localizedDescription);
					}
				}
			}
		} else {
			TabNavigationView(
				nav: TabNavigation(
					stateService: self.viewModel.services
				)
			);
		}
	}
}

struct loading_view_Previews: PreviewProvider {
    
	public var clientOptions: ClientOptions = ClientOptions();
	static var previews: some View {
		
        LoadingView(
			viewModel: LoadingViewModel(
				services: AppState(
					pokeSdkClient: PokeSdkClient(
						clientOptions: ClientOptions()
					)
				)
			)
		)
    }
}
