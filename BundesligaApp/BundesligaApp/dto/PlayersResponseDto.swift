//
//  PlayersResponseDto.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 12/04/25.
//

import Foundation

struct PlayersResDTO: Codable {
    let response: [PlayersResResponseDTO]
    let paging: PlayersResPagingDTO?
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try container.decodeIfPresent([PlayersResResponseDTO].self, forKey: .response) ?? []
        self.paging = try container.decodeIfPresent(PlayersResPagingDTO.self, forKey: .paging)
    }
}

struct PlayersResPagingDTO: Codable {
    let current: Int?
    let total: Int?
}

struct PlayersResResponseDTO: Codable {
    let player: PlayersResPlayerDTO?
    let statistics: [PlayersResStatisticsDTO]
}

struct PlayersResPlayerDTO: Codable {
    let name: String?
    let photo: String?
    let age: Int?
    let height: String?
    let weight: String?
    let nationality: String?
}

struct PlayersResStatisticsDTO: Codable {
    let games: PlayersResStatisticsGamesDTO?
    let goals: PlayersResStatisticsGoalsDTO?
    let passes: PlayersResStatisticsPassesDTO?
    let cards: PlayersResStatisticsCardsDTO?
}

struct PlayersResStatisticsGamesDTO: Codable {
    let appearences: Int?
    let minutes: Int?
    let rating: String?
    let position: String?
}

struct PlayersResStatisticsGoalsDTO: Codable {
    let total: Int?
    let assists: Int?
}

struct PlayersResStatisticsPassesDTO: Codable {
    let total: Int?
    let accuracy: Int?
}

struct PlayersResStatisticsCardsDTO: Codable {
    let yellow: Int?
    let yellowred: Int?
    let red: Int?
}
