//
//  TeamBadge.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 11/04/25.
//
import SwiftUI
import SDWebImageSwiftUI

struct TeamBadge: View {
    var team : Team
    var goals: Int
    var date : Date
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: team.logoUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
            Text(team.name)
            Spacer()
            if date < .now {
                Text("\(goals)")
                    .bold()
            }
        }
    }
}
