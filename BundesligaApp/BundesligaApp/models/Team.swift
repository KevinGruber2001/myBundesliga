//
//  Team.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//
import SwiftData
import Foundation

@Model
class Team {
    @Attribute(.unique)
    var teamId: Int
    var name: String
    var logoUrl: String
    var statistics: TeamStatistics?
    var players: [Player]
    
    init(teamId: Int, name: String, logoUrl: String, statistics: TeamStatistics?, players: [Player] = []) {
        self.teamId = teamId
        self.name = name
        self.logoUrl = logoUrl
        self.statistics = statistics
        self.players = players
    }
    
    static func fromTeamResponse(_ response: TeamResDTO) -> Team? {
        guard let res = response.response,
              let resTeamName = res.team?.name,
              let resTeamLogoUrl = res.team?.logo,
              let resTeamId = res.team?.id
        else {
            return nil
        }
        
        let dict: [String: Int] = [
            "0-15": res.goals?.for?.minute?.from0to15?.total ?? 0,
            "16-30": res.goals?.for?.minute?.from16to30?.total ?? 0,
            "31-45": res.goals?.for?.minute?.from31to45?.total ?? 0,
            "46-60": res.goals?.for?.minute?.from46to60?.total ?? 0,
            "61-75": res.goals?.for?.minute?.from61to75?.total ?? 0,
            "76-90": res.goals?.for?.minute?.from76to90?.total ?? 0,
            "91-105": res.goals?.for?.minute?.from76to90?.total ?? 0,
        ]
        let dictConceded: [String: Int] = [
            "0-15": res.goals?.against?.minute?.from0to15?.total ?? 0,
            "16-30": res.goals?.against?.minute?.from16to30?.total ?? 0,
            "31-45": res.goals?.against?.minute?.from31to45?.total ?? 0,
            "46-60": res.goals?.against?.minute?.from46to60?.total ?? 0,
            "61-75": res.goals?.against?.minute?.from61to75?.total ?? 0,
            "76-90": res.goals?.against?.minute?.from76to90?.total ?? 0,
            "91-105": res.goals?.against?.minute?.from76to90?.total ?? 0,
        ]
        
        let stats = TeamStatistics(wins: res.fixtures?.wins?.total,
                                   draws: res.fixtures?.draws?.total,
                                   losses: res.fixtures?.draws?.total,
                                   form: res.form,
                                   totalGoals: res.goals?.for?.total?.total,
                                   avgGoals: res.goals?.for?.average?.total,
                                   concededGoals: res.goals?.against?.total?.total,
                                   avgConcededGoals: res.goals?.against?.average?.total,
                                   goalsPerMinutes: dict,
                                   goalsConcededPerMinutes: dictConceded
        )
        
        return Team(teamId: resTeamId, name: resTeamName, logoUrl: resTeamLogoUrl, statistics: stats)
    }
}
