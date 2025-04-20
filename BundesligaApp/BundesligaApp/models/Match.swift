//
//  Match.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 10/04/25.
//

import Foundation

class Match : Identifiable {
    var date: Date
    var location: String
    var away : Team
    var home : Team
    var awayGoals: Int
    var homeGoals: Int
    
    init(date: Date, location: String, away: Team, home: Team, awayGoals: Int = 0, homeGoals: Int = 0) {
        self.date = date
        self.location = location
        self.away = away
        self.home = home
        self.awayGoals = awayGoals
        self.homeGoals = homeGoals
    }
}
