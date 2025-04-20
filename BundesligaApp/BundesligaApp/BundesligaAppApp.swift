//
//  BundesligaAppApp.swift
//  BundesligaApp
//
//  Created by Kevin Gruber on 07/04/25.
//

import SwiftUI
import SwiftData

@main
struct BundesligaAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Team.self])
    }
}
