//
//  League.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 10/04/25.
//

import Foundation

class League {
    var championsLeaguePlaces: Int
    var euroLeaguePlaces: Int
    var relegationPlaces: Int
    var seasons: [Season]
    var teams: [Team]
    
    init(championsLeaguePlaces: Int, euroLeaguePlaces: Int, relegationPlaces: Int, seasons: [Season], teams: [Team]) {
        self.championsLeaguePlaces = championsLeaguePlaces
        self.euroLeaguePlaces = euroLeaguePlaces
        self.relegationPlaces = relegationPlaces
        self.seasons = seasons
        self.teams = teams
    }
}
