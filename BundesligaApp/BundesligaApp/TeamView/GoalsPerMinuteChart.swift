//
//  GoalsPerMinuteChart.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 13/04/25.
//

import SwiftUI
import Charts

struct GoalsPerMinuteChart: View {
    var data: [String: Int]
    var label: String
    
    init(data: [String : Int], label: String) {
        self.data = data
        self.label = label
    }
    var body: some View {
        if !data.isEmpty {
            Section(label) {
                Chart {
                    ForEach(data.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        BarMark(x: .value("Test", key), y: .value("Test2", value))
                    }
                }
                .frame(height: 200)
                .padding(4)
            }
        }
    }
}
