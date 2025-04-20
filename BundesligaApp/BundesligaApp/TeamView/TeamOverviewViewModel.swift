//
//  TeamOverviewViewModel.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 12/04/25.
//

import Foundation
import OSLog
import SwiftData

@Observable
class TeamOverviewViewModel {
    var team: Team?
    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "", category: "TeamOverview")
    let teamId: Int
    let fetchFromApi: Bool
    
    init(teamId: Int) {
        self.teamId = teamId
        self.fetchFromApi = true
    }
    
    init(team: Team) {
        self.team = team
        self.teamId = team.teamId
        self.fetchFromApi = false
    }
    
    func loadData() {
        if !fetchFromApi {
            return
        }
        Task {
            await getTeam(id: teamId)
            await getPlayers(id: teamId)
        }
    }
    
    func sortPlayers(players: [Player]) -> [Player] {
        return players.sorted {
            guard let position1Index = Constants.positions.firstIndex(of: $0.position),
                  let position2Index = Constants.positions.firstIndex(of: $1.position) else {
                return false
            }
            return position1Index < position2Index
        }
    }
    
    
    // gets the Team and Team Statistics
    func getTeam(id: Int) async {
        logger.info("TEAM OVERVIEW: GET TEAM REQUEST")
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            logger.error( "API_KEY not set in Info.plist")
            return
        }
        
        guard let url = URL(string: "\(Constants.apiUrl)/teams/statistics?league=\(Constants.leagueId)&season=\(Constants.season)&team=\(id)") else {
            logger.error("Invalid URL")
            return
        }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(apiKey, forHTTPHeaderField: "x-apisports-key")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            
            let result = try decoder.decode(TeamResDTO.self, from: data)
            
            team = Team.fromTeamResponse(result)
        } catch {
            logger.error("Error fetching data: \(error)")
        }
    }
    
    // gets the Players of the team
    func getPlayers(id: Int) async {
        logger.info("TEAM OVERVIEW: GET PLAYERS REQUEST")
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            logger.error( "API_KEY not set in Info.plist")
            return
        }
        var players : [Player] = []
        var page = 1
        
        var fetching = true
        
        while fetching {
            guard let url = URL(string: "\(Constants.apiUrl)/players?league=\(Constants.leagueId)&season=\(Constants.season)&team=\(id)&page=\(page)") else {
                logger.error("Invalid URL")
                continue
            }
            
            do {
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue(apiKey, forHTTPHeaderField: "x-apisports-key")
                
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                
                let result = try decoder.decode(PlayersResDTO.self, from: data)
                
                players.append(contentsOf: Player.fromPlayersDto(result))
                
                guard let currentPage = result.paging?.current,
                      let maxPage = result.paging?.total else {
                    fetching = false
                    break
                }
                
                if currentPage >= maxPage {
                    fetching = false
                } else {
                    page += 1
                }
            } catch {
                logger.error("Error fetching data: \(error)")
            }
        }
        
        // after fetching
        team?.players = sortPlayers(players: players)
    }
}
