//
//  MatchesViewModel.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 11/04/25.
//

import Foundation
import OSLog

@Observable
class MatchesViewModel {
    var matchDay: MatchDay?
    
    var rescheduledMatches: [Match] = []
    var fridayMatches : [Match] = []
    var saturdayMatches : [Match] = []
    var sundayMatches : [Match] = []
    
    var fetchError : Bool = false
    
    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "", category: "MatchesView")
    
    
    func loadData() {
        Task {
            await getMatches(round: 30)
        }
    }
    
    func increaseMatchDay() {
        if let md = matchDay {
            guard md.round < Constants.totalRouds else {
                return
            }
            
            Task {
                await getMatches(round: md.round + 1)
            }
        }
    }
    
    func decreaseMatchDay() {
        if let md = matchDay {
            guard md.round > 1 else {
                return
            }
            Task {
                await getMatches(round: md.round - 1)
            }
        }
    }
    
    func getMatches(round: Int) async {
        logger.info("MATCHES VIEW: GET MATCHES")
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            logger.error( "API_KEY not set in Info.plist")
            return
        }
        
        guard let url = URL(string: "\(Constants.apiUrl)/fixtures?league=\(Constants.leagueId)&season=\(Constants.season)&round=Regular%20Season%20-%20\(round)") else {
            logger.error("Invalid URL")
            return
        }
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(apiKey, forHTTPHeaderField: "x-apisports-key")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            
            let result = try decoder.decode(FixturesResponseDTO.self, from: data)
            
            print(result)
            
            let md = MatchDay.fromFixturesResponse(result)
            md?.round = round
            
            matchDay = md
            
            let calender = Calendar.current
            fridayMatches = []
            saturdayMatches = []
            sundayMatches = []
            rescheduledMatches = []
            
            for match: Match in matchDay?.matches ?? [] {
                switch calender.component(.weekday, from: match.date) {
                case 6:
                    fridayMatches.append(match)
                case 7:
                    saturdayMatches.append(match)
                case 1:
                    sundayMatches.append(match)
                default:
                    rescheduledMatches.append(match)
                }
            }
            fetchError = false
        } catch {
            logger.error("Error fetching data: \(error)")
            fetchError = true
        }
    }
}
