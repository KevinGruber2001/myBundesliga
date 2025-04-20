//
//  Standing.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 12/04/25.
//

import Foundation

@Observable
class Standing : Identifiable {
    var rank: Int
    var teamName: String
    var teamLogo: String
    var teamId: Int
    var points: Int
    
    init(rank: Int, teamName: String, teamLogo: String, points: Int, teamId: Int) {
        self.rank = rank
        self.teamName = teamName
        self.teamLogo = teamLogo
        self.points = points
        self.teamId = teamId
    }
    
    static func fromStandingsResponse(_ response: StandingsResponseDTO) -> [Standing] {
        guard let standings = response.response?.league?.standings else {
            return []
        }
        var result : [Standing] = []
        
        for st in standings {
            if let rk = st.rank, let teamName = st.team?.name, let teamId = st.team?.id {
                result.append(Standing(rank: rk,
                                       teamName: teamName,
                                       teamLogo: st.team?.logo ?? "",
                                       points: st.points ?? 0,
                                       teamId: teamId))
            }
        }
        return result
    }
}
