//
//  LeagueTableView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 08/04/25.
//

import SwiftUI

struct LeagueTableView: View {
    @State var viewModel = LeagueTableViewModel()
    
    var body: some View {
        if viewModel.fetchError == true {
            Text("An error occured")
        } else {
            NavigationView {
                if !viewModel.standings.isEmpty {
                    List {
                        ForEach(viewModel.standings) { standing in
                            NavigationLink {
                                TeamOverviewView(teamId: standing.teamId)
                            } label : {
                                ListTile(teamName: standing.teamName,
                                         teamLogo: standing.teamLogo,
                                         position: standing.rank,
                                         points: standing.points)
                            }
                        }
                    }
                    .navigationTitle("League table")
                } else {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    LeagueTableView()
}
