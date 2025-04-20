//
//  PlayerOverviewView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//
import SwiftUI

struct PlayerOverviewView: View {
    var player: Player
    var infoArray: [(String, String)]
    var statsArray: [(String, String?)] = []
    
    init(player: Player) {
        self.player = player
        
        self.infoArray = [
            ("Name", player.name),
            ("Age", "\(player.age)"),
            ("Height", player.height),
            ("Weight", player.weight),
            ("Nationality", player.nationality),
            ("Position", player.position)
        ]
        if let stats = player.statistics {
            self.statsArray = [
                ("Goals", stats.goals.flatMap { String($0) }),
                ("Assists", stats.assists.flatMap { String($0) }),
                ("Played minutes", stats.playedMinutes.flatMap { String($0) }),
                ("Appearences", stats.appearences.flatMap { String($0) }),
                ("Rating", stats.rating.flatMap { String($0) }),
                ("Passes", stats.passes.flatMap { String($0) }),
                ("Pass accuracy", stats.passAccuracy.flatMap { String($0) }),
                ("Red cards", stats.redCards.flatMap { String($0) }),
                ("Yellow cards", stats.yellowCards.flatMap { String($0) }),
                ("Red-yellow cards", stats.redYellowCards.flatMap { String($0) }),
            ]
        }
    }
    
    var body: some View {
        VStack {
            Header(name: player.name, url: player.imageUrl)
            
            List {
                Section("General") {
                    ForEach(infoArray, id: \.0) {key, value in
                        LabeledContent(key) {
                            Text(value)
                        }
                    }
                }
                
                if player.statistics != nil {
                    Section("Statistics") {
                        ForEach(statsArray, id: \.0) { key, value in
                            if let saveValue = value {
                                LabeledContent {
                                    Text(saveValue)
                                } label: {
                                    Text(key)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
