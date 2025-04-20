//
//  StandingsResponseDto.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 12/04/25.
//

import Foundation

struct StandingsResponseDTO: Codable {
    let response: StandingsResponseResponseDTO?
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try container.decodeIfPresent([StandingsResponseResponseDTO].self, forKey: .response)?.first
    }
}

struct StandingsResponseResponseDTO: Codable {
    let league: StandingsResponseLeagueDTO?
}

struct StandingsResponseLeagueDTO: Codable {
    let standings: [FixturesResponseStandingsDTO]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.standings = try container.decode([[FixturesResponseStandingsDTO]].self, forKey: .standings).first ?? []
    }
}

struct FixturesResponseStandingsDTO: Codable {
    let rank: Int?
    let team: FixturesResponseTeamDTO?
    let points: Int?
}

struct FixturesResponseTeamDTO: Codable {
    let id : Int?
    let name: String?
    let logo: String?
}
