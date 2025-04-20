//
//  PlayersListView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlayersListView: View {
    var players: [Player]
    
    
    var body: some View {
        ForEach(players) { player in
            NavigationLink {
                PlayerOverviewView(player: player)
            } label: {
                HStack {
                    WebImage(url: URL(string: player.imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                    LabeledContent("\(player.name)") {
                        Text(Constants.positionAbbreviations[player.position] ?? "unk.")
                    }
                }
            }
        }
    }
}
