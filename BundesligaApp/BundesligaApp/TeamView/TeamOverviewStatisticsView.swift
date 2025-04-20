//
//  TeamOverviewStatisticsView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import SwiftUI

struct TeamOverviewStatisticsView: View {
    var teamStatistics: TeamStatistics
    
    var statsArray: [(String, String?)]
    
    init(teamStatistics: TeamStatistics) {
        self.teamStatistics = teamStatistics
        self.statsArray = [
            ("Wins", teamStatistics.wins.flatMap { String($0) }),
            ("Draws", teamStatistics.draws.flatMap { String($0) }),
            ("Losses", teamStatistics.losses.flatMap { String($0) }),
            ("Total Goals scored", teamStatistics.totalGoals.flatMap { String($0) }),
            ("Total Goals conceded", teamStatistics.concededGoals.flatMap { String($0) }),
            ("Average Goals scored", teamStatistics.avgGoals),
            ("Average Goals conceded", teamStatistics.avgConcededGoals)
        ]
    }
    
    var body: some View {
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
