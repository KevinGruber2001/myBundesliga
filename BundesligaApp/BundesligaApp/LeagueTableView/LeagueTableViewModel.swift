//
//  LeagueTableViewModel.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 12/04/25.
//

import Foundation
import OSLog


@Observable
class LeagueTableViewModel {
    var standings: [Standing] = []
    
    var fetchError: Bool = false
    
    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "", category: "LeagueTableView")
    
    
    init() {
        Task {
            await getStandings()
        }
    }
    
    func getStandings() async {
        logger.info("LEAGUE TABLE: GET STANDINGS REQUEST")
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            logger.error( "API_KEY not set in Info.plist")
            return
        }
        guard let url = URL(string: "\(Constants.apiUrl)/standings?league=\(Constants.leagueId)&season=\(Constants.season)") else {
            logger.error("Invalid URL")
            return
        }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(apiKey, forHTTPHeaderField: "x-apisports-key")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            
            let result = try decoder.decode(StandingsResponseDTO.self, from: data)
      
            standings = Standing.fromStandingsResponse(result)
            fetchError = false
        } catch {
            fetchError = true
            logger.error("Error fetching data: \(error)")
        }
    }
}
