//
//  AppConstants.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 12/04/25.
//

import Foundation

struct Constants {
    static let apiUrl = "https://v3.football.api-sports.io"
    static let leagueId = 78
    static let totalRouds = 34
    static let season = 2024
    static let positions = ["Goalkeeper", "Defender", "Midfielder", "Attacker"]
    static let positionAbbreviations: [String: String] = [
        "Goalkeeper": "GK",
        "Defender": "DEF",
        "Midfielder": "MID",
        "Attacker": "STR"
    ]
}
