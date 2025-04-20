//
//  TeamStatistics.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import Foundation
import SwiftData

@Model
class TeamStatistics {
    var wins: Int?
    var draws: Int?
    var losses: Int?
    
    var totalGoals: Int?
    var avgGoals: String?
    var concededGoals: Int?
    var avgConcededGoals: String?
    
    var goalsPerMinutes: [String: Int]
    var goalsConcededPerMinutes: [String: Int]
    
    var form: String?
    
    init(wins: Int? = nil,
         draws: Int? = nil,
         losses: Int? = nil,
         form: String? = nil,
         totalGoals: Int? = nil,
         avgGoals: String? = nil,
         concededGoals: Int? = nil,
         avgConcededGoals: String? = nil,
         goalsPerMinutes: [String: Int] = [:],
         goalsConcededPerMinutes: [String: Int] = [:]) {
        self.wins = wins
        self.draws = draws
        self.losses = losses
        self.form = form
        self.totalGoals = totalGoals
        self.avgGoals = avgGoals
        self.concededGoals = concededGoals
        self.avgConcededGoals = avgConcededGoals
        self.goalsPerMinutes = goalsPerMinutes
        self.goalsConcededPerMinutes = goalsConcededPerMinutes
    }
}
