//
//  tab.navigation.swift
//  pokeday
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;
import SwiftUI;

class TabNavigation: ObservableObject {
	
	private var stateService: StateServices_P;
	
	init(stateService: StateServices_P) {
		
		self.stateService = stateService;
	}
	
	@ViewBuilder func playgroundScreen() -> some View {
		
		Text("catch ur pokemon here")
	}
	
	@ViewBuilder func pokedexScreen() -> some View {
		PokedexView(
			viewModel: PokedexViewModel(services: self.stateService)
		);
	}
	
	@ViewBuilder func profilScreen() -> some View {
		ProfileView(
			viewModel: ProfileViewModel(services: self.stateService)
		);
	}
}

struct TabNavigationView: View {
	
	@StateObject var nav: TabNavigation;
	@State private var selection = 2;
	
	var body: some View {
		
		TabView(selection: self.$selection) {
			
			self.nav.pokedexScreen().tabItem {
				Label("Pokedex", systemImage: "macstudio.fill")
			}.tag(1)
			
			self.nav.playgroundScreen().tabItem {
				Label("Playground", systemImage: "gamecontroller.fill");
			}.tag(2)
			
			self.nav.profilScreen().tabItem {
				Label("Profil", systemImage: "person.fill")
			}.tag(3)
		}
	}
}
