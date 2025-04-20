//
//  Season.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 10/04/25.
//

import Foundation

class Season {
    var startDate: Date
    var endDate: Date
    var matchDays: [MatchDay]
    
    init(startDate: Date, endDate: Date, matchDays: [MatchDay]) {
        self.startDate = startDate
        self.endDate = endDate
        self.matchDays = matchDays
    }
}
