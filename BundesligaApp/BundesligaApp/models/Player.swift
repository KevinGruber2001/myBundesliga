//
//  Player.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//
import Foundation
import SwiftData

@Model
class Player : Identifiable {
    var id = UUID()
    var name: String
    var imageUrl: String
    var age: Int
    var height: String
    var weight: String
    var nationality: String
    var position: String
    var statistics: PlayerStatistics?
    
    init(name: String,
         imageUrl: String,
         age: Int,
         height: String,
         weight: String,
         nationality: String,
         position: String,
         statistics: PlayerStatistics? = nil) {
        self.name = name
        self.imageUrl = imageUrl
        self.age = age
        self.height = height
        self.statistics = statistics
        self.weight = weight
        self.position = position
        self.nationality = nationality
    }
    
    static func fromPlayersDto(_ response: PlayersResDTO) -> [Player] {
        var players : [Player] = []
        
        for player in response.response {
            guard let playerRes = player.player else {
                continue
            }
            
            var statistics: PlayerStatistics?
            if let stats = player.statistics.first {
                statistics = PlayerStatistics.fromPlayerStatisticsDTO(stats)
            }
            
            players.append(Player(name: playerRes.name ?? "",
                                  imageUrl: playerRes.photo ?? "",
                                  age: playerRes.age ?? 0,
                                  height: playerRes.height ?? "Not available",
                                  weight: playerRes.weight ?? "Not available",
                                  nationality: playerRes.nationality ?? "Not available",
                                  position: player.statistics.first?.games?.position ?? "",
                                  statistics: statistics))
        }
        return players
    }
}
