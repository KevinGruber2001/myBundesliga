//
//  MatchPreviewView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import SwiftUI

struct MatchPreviewView: View {
    @State var match : Match
    var body: some View {
        HStack {
            VStack {
                TeamBadge(team: match.home, goals: match.homeGoals, date: match.date)
                TeamBadge(team: match.away, goals: match.awayGoals, date: match.date)
            }
            Spacer()
            if match.date > .now {
                Text(DateFormatter.localizedString(from: match.date, dateStyle: .none, timeStyle: .short))
                    .padding(.trailing)
            }
        }
        .padding(2)
    }
}
