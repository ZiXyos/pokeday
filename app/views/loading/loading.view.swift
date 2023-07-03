//
//  loading.view.swift
//  pokeday
//
//  Created by Ktchoumh on 3/28/23.
//

import SwiftUI;

struct LoadingView: View {
    
	@State var isLoading = false;
	private let viewModel: LoadingViewModel;

	public init(viewModel: LoadingViewModel) {

		self.viewModel = viewModel;
	}
	
	var body: some View {
		if !isLoading {
			ZStack() {
				GeometryReader { geo in
					Image(uiImage: self.viewModel.bgImage)
						.resizable(capInsets: .init())
						.frame(
							width: geo.size.width,
							height: geo.size.height,
							alignment: .center
						).scaleEffect(1.75)
				}.edgesIgnoringSafeArea(.all)
			}.onAppear {
				self.viewModel.playMusic();
				Task {
					do {
						try await self.viewModel.getRemoteData();
						self.isLoading = true;
					} catch {
						fatalError(error.localizedDescription);
					}
				}
			}
		} else {
			TabNavigationView(
				nav: TabNavigation(
					stateService: self.viewModel.services
				)
			).task {
				self.viewModel.stopMusic();
			};
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
