//
//  MatchDay.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 10/04/25.
//

import Foundation

class MatchDay : Identifiable {
    var round: Int
    var startDate: Date?
    var endDate: Date?
    var matches: [Match]
    
    init(startDate: Date?, endDate: Date?, matches: [Match], round: Int) {
        self.startDate = startDate
        self.endDate = endDate
        self.matches = matches
        self.round = round
    }
    
    static func fromFixturesResponse(_ response: FixturesResponseDTO) -> MatchDay? {
        // this is a temp variable that will be overwritten in the view model
        let tempRound = 0
        
        
        var matches: [Match] = []
        
        // Extract start and end dates based on matches
        let dateFormatter = ISO8601DateFormatter()
        
        
        for mt in response.response {
            guard let resultDateString = mt.fixture?.date,
                  let resultDate = dateFormatter.date(from: resultDateString),
                  let resultAwayTeamName = mt.teams?.away?.name,
                  let resultAwayTeamLogo = mt.teams?.away?.logo,
                  let resultAwayTeamId = mt.teams?.away?.id,
                  let resultHomeTeamName = mt.teams?.home?.name,
                  let resultHomeTeamLogo = mt.teams?.home?.logo,
                  let resultHomeTeamId = mt.teams?.home?.id
            else {
                // if there are null values, dont include the match in the current list
                continue
            }
            
            let home = Team(teamId: resultHomeTeamId,
                            name: resultHomeTeamName,
                            logoUrl: resultHomeTeamLogo,
                            statistics: nil)
            let away = Team(teamId: resultAwayTeamId,
                            name: resultAwayTeamName,
                            logoUrl: resultAwayTeamLogo,
                            statistics: nil)
            
            matches.append(Match(date: resultDate,
                                 location: "",
                                 away: away,
                                 home: home,
                                 awayGoals: mt.goals?.away ?? 0,
                                 homeGoals: mt.goals?.home ?? 0))
        }
        
        let startDate = matches.map { $0.date }.min()
        let endDate = matches.map { $0.date }.max()
        
        return MatchDay(startDate: startDate, endDate: endDate, matches: matches, round: tempRound)
    }
}
