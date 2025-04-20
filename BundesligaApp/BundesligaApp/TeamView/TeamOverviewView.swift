//
//  TeamOverviewView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import SwiftUI
import Charts
import SwiftData
import ConfettiSwiftUI

struct TeamOverviewView: View {
    @State var viewModel: TeamOverviewViewModel
    
    @Environment(\.modelContext) var context
    @Query var storedTeams: [ Team ]
    
    @State var isFavorite: Bool = false
    
    @State var confettiTrigger: Int = 0
    
    // online constructor
    init(teamId: Int) {
        self.viewModel = TeamOverviewViewModel(teamId: teamId)
    }
    
    // offline constructor
    init(team: Team) {
        self.viewModel = TeamOverviewViewModel(team: team)
    }
    
    func addToFavorites() {
        if let t = viewModel.team {
            let teamExists = storedTeams.contains { storedTeam in
                t.teamId == storedTeam.teamId
            }
            if !teamExists {
                confettiTrigger += 1
                context.insert(t)
            }
        }
    }
    
    //Need to remove by ID, becuase Team fetched by API is diffrent to localy stored Team
    func removeFromFavorites() {
        if let t = viewModel.team {
            let teamId : Int = t.teamId
            try? context.delete(model: Team.self,
                                where: #Predicate { $0.teamId == teamId }
            )
        }
    }
    
    var body: some View {
        VStack {
            if let team = viewModel.team {
                VStack {
                    Header(name: team.name, url: team.logoUrl, round: false)
                    List {
                        HStack {
                            Toggle("Favorite", isOn: $isFavorite)
                        }.onChange(of: isFavorite) {
                            if isFavorite {
                                addToFavorites()
                            } else {
                                removeFromFavorites()
                            }
                        }
                        
                        if let stats = team.statistics {
                            Section("Statistics") {
                                TeamOverviewStatisticsView(teamStatistics: stats)
                            }
                        }
                        
                        GoalsPerMinuteChart(data: team.statistics?.goalsPerMinutes ?? [:], label: "Goals per minutes")

                        GoalsPerMinuteChart(data: team.statistics?.goalsConcededPerMinutes ?? [:],
                                            label: "Goals per minutes conceded")
                        
                        Section("Players") {
                            PlayersListView(players: team.players)
                        }
                    }
                }
                .onAppear {
                    isFavorite = storedTeams.contains { st in
                        st.name == team.name
                    }
                }
                .confettiCannon(trigger: $confettiTrigger)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    TeamOverviewView(teamId: 160)
}
