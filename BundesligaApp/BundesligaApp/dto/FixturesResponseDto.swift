//
//  MatchDto.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 10/04/25.
//

import Foundation

struct FixturesResponseDTO: Codable {
    let response: [MatchDTO]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try container.decodeIfPresent([MatchDTO].self, forKey: .response) ?? []
    }
}

struct MatchDTO: Codable {
    let fixture: FixtureDTO?
    let teams: TeamsDTO?
    let goals: GoalsDTO?
}

struct FixtureDTO: Codable {
    let date: String?
}

struct TeamsDTO: Codable {
    let home: TeamDTO?
    let away: TeamDTO?
}

struct TeamDTO: Codable {
    let name: String?
    let logo: String?
    let id: Int?
}

struct GoalsDTO: Codable {
    let home: Int?
    let away: Int?
    let id: Int?
}
