//
//  TeamResponseDto.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 12/04/25.
//

import Foundation

struct TeamResDTO: Codable {
    let response: TeamResResponseDTO?
}

struct TeamResResponseDTO: Codable {
    let team: TeamResTeamDTO?
    let goals: TeamResGoalsDTO?
    let form: String?
    let fixtures: TeamResFixturesDTO?
}

struct TeamResFixturesDTO: Codable {
    let wins: TeamResFixturesWinsDTO?
    let draws: TeamResFixturesDrawsDTO?
    let loses: TeamResFixturesLossesDTO?
}

struct TeamResFixturesWinsDTO: Codable {
    let total: Int?
}

struct TeamResFixturesDrawsDTO: Codable {
    let total: Int?
}

struct TeamResFixturesLossesDTO: Codable {
    let total: Int?
}

struct TeamResTeamDTO: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}

struct TeamResGoalsDTO: Codable {
    let `for`: TeamResGoalsForDTO?
    let against: TeamResGoalsForDTO?
}

struct TeamResGoalsForDTO: Codable {
    let total: TeamResGoalsForTotalDTO?
    let average: TeamResGoalsForAvgDTO?
    let minute: TeamResGoalsForMinuteDTO?
}

struct TeamResGoalsForMinuteDTO: Codable {
    let from0to15: TeamResGoalsForTotalDTO?
    let from16to30: TeamResGoalsForTotalDTO?
    let from31to45: TeamResGoalsForTotalDTO?
    let from46to60: TeamResGoalsForTotalDTO?
    let from61to75: TeamResGoalsForTotalDTO?
    let from76to90: TeamResGoalsForTotalDTO?
    let from91to105: TeamResGoalsForTotalDTO?
    
    enum CodingKeys: String, CodingKey {
            case from0to15 = "0-15"
            case from16to30 = "16-30"
            case from31to45 = "31-45"
            case from46to60 = "46-60"
            case from61to75 = "61-75"
            case from76to90 = "76-90"
            case from91to105 = "91-105"
        }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.from0to15 = try container.decodeIfPresent(TeamResGoalsForTotalDTO.self, forKey: .from0to15)
        self.from16to30 = try container.decodeIfPresent(TeamResGoalsForTotalDTO.self, forKey: .from16to30)
        self.from31to45 = try container.decodeIfPresent(TeamResGoalsForTotalDTO.self, forKey: .from31to45)
        self.from46to60 = try container.decodeIfPresent(TeamResGoalsForTotalDTO.self, forKey: .from46to60)
        self.from61to75 = try container.decodeIfPresent(TeamResGoalsForTotalDTO.self, forKey: .from61to75)
        self.from76to90 = try container.decodeIfPresent(TeamResGoalsForTotalDTO.self, forKey: .from76to90)
        self.from91to105 = try container.decodeIfPresent(TeamResGoalsForTotalDTO.self, forKey: .from91to105)
    }
}

struct TeamResGoalsForTotalDTO: Codable {
    let total: Int?
}

struct TeamResGoalsForAvgDTO: Codable {
    let total: String?
}
