//
//  loading.view.swift
//  pokeday
//
//  Created by Ktchoumh on 3/28/23.
//

import SwiftUI

struct LoadingView: View {
    
	@State var isLoading = true;
	private let viewModel: LoadingViewModel;
	
	public init(viewModel: LoadingViewModel) {

		self.viewModel = viewModel
	}
	
	var body: some View {
		if isLoading {
			Button("Load") {
				Task {
					do {
						try await self.viewModel.loadRemoteData();
						self.isLoading = false;
						print("[LOG::TASK]: \(self.isLoading)");
					} catch {
						print(error);
						fatalError(error.localizedDescription);
					}
				}
			}
		} else {
			Text("HELLO I'LL PUSH NAV");
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
