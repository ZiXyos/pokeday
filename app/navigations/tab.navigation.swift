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
		Text("catch'em ALL")
	}
	
	@ViewBuilder func profilScreen() -> some View {
		Text(
			"welcome trainer " + (self.stateService.appManager.getDefault(.token) ?? "user")
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
