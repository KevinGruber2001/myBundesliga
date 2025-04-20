//
//  PlayerStatistics.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import Foundation
import SwiftData

// The API is very inconsistent with its statistic parameter, so i keep everything optional, and only show it if provided by the api
@Model
class PlayerStatistics {
    var goals: Int?
    var assists: Int?
    var playedMinutes: Int?
    var redCards: Int?
    var yellowCards: Int?
    var redYellowCards: Int?
    var appearences: Int?
    var rating: String?
    var passes: Int?
    var passAccuracy: Int?
    
    init(goals: Int?,
         assists: Int?,
         playedMinutes: Int?,
         redCards: Int?,
         yellowCards: Int?,
         redYellowCards: Int?,
         appearences: Int?,
         rating: String?,
         passes: Int?,
         passAccuracy: Int?) {
        self.goals = goals
        self.assists = assists
        self.playedMinutes = playedMinutes
        self.redCards = redCards
        self.yellowCards = yellowCards
        self.redYellowCards = redYellowCards
        self.appearences = appearences
        self.rating = rating
        self.passes = passes
        self.passAccuracy = passAccuracy
    }
    
    static func fromPlayerStatisticsDTO(_ response: PlayersResStatisticsDTO) -> PlayerStatistics {
        return PlayerStatistics(goals: response.goals?.total,
                                assists: response.goals?.assists,
                                playedMinutes: response.games?.minutes,
                                redCards: response.cards?.red,
                                yellowCards: response.cards?.yellow,
                                redYellowCards: response.cards?.yellowred,
                                appearences: response.games?.appearences,
                                rating: response.games?.rating,
                                passes: response.passes?.total,
                                passAccuracy: response.passes?.accuracy)
    }
}
