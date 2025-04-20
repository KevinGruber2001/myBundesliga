//
//  FavoritesViewContent.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 14/04/25.
//

import SwiftUI
import SwiftData
import SDWebImageSwiftUI

struct FavoritesViewContent: View {
    @Environment(\.modelContext)
    private var context
    
    @Query
    private var teams: [Team]
    
    init(searchQuery: String) {
        _teams = Query(
            filter: #Predicate<Team> { team in
                if searchQuery.isEmpty {
                    true
                } else {
                    team.name.localizedStandardContains(searchQuery)
                }
            }
        )
    }
    
    var body: some View {
        List {
            ForEach(teams) { team in
                NavigationLink {
                    TeamOverviewView(team: team)
                } label : {
                    HStack {
                        WebImage(url: URL(string: team.logoUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        Text(team.name)
                    }
                }
            }
            .onDelete(perform: removeTeamFromFavorites)
        }
    }
    
    private func removeTeamFromFavorites(indexes: IndexSet) {
        for index in indexes {
            context.delete(teams[index])
        }
    }
}
