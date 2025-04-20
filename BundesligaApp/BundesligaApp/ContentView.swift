//
//  ContentView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 07/04/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            LeagueTableView()
                .tabItem {
                    Label("League", systemImage: "list.bullet")
                }
            MatchesView()
                .tabItem {
                    Label("Matches", systemImage: "soccerball")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
