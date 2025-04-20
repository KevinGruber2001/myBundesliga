//
//  FavoritesView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 13/04/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            FavoritesViewContent(searchQuery: searchText)
            .navigationTitle("Favorites")
                .searchable(text: $searchText)
        }
    }
}

#Preview {
    FavoritesView()
}
