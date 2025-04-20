//
//  MatchesView.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 09/04/25.
//

import SwiftUI

struct MatchesView: View {
    @State var viewModel = MatchesViewModel()
    
    var body: some View {
        VStack {
            if viewModel.fetchError == true {
                Text("An error occured")
            } else {
                VStack {
                    ChangeMatchDatyView(viewModel: $viewModel)
                    
                    List {
                        Section("Friday") {
                            ForEach(viewModel.fridayMatches
                            ) { match in
                                MatchPreviewView(match: match)
                            }
                        }
                        Section("Saturday") {
                            ForEach(viewModel.saturdayMatches
                            ) { match in
                                MatchPreviewView(match: match)
                            }
                        }
                        Section("Sunday") {
                            ForEach(viewModel.sundayMatches
                            ) { match in
                                MatchPreviewView(match: match)
                            }
                        }
                        if !viewModel.rescheduledMatches.isEmpty {
                            Section("Rescheduled") {
                                ForEach(viewModel.rescheduledMatches
                                ) { match in
                                    MatchPreviewView(match: match)
                                }
                            }
                        }
                    }
                }
            }
        }.onAppear {
            viewModel.loadData()
        }
    }
}

private struct ChangeMatchDatyView: View {
    @Binding var viewModel: MatchesViewModel
    var body: some View {
        if let matchDay = viewModel.matchDay {
            HStack {
                Spacer()
                Button {
                    viewModel.decreaseMatchDay()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                Spacer()
                Text("Match Day: \(matchDay.round)")
                    .font(.headline)
                Spacer()
                Button {
                    viewModel.increaseMatchDay()
                } label: {
                    Image(systemName: "chevron.forward")
                }
                
                Spacer()
            }
        } else {
            ProgressView()
        }
    }
}

#Preview {
    MatchesView()
}
