//
//  ScorcererApp.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

@main
struct ScorcererApp: App {
    var test: [Player] = [
        Player(id: .init(), name: "Maddie", score: 12),
        Player(id: .init(), name: "Spencer", score: 40),
        Player(id: .init(), name: "Katy", score: 231),
        Player(id: .init(), name: "Alexandra", score: 9)
    ]

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ScorcererViewModel())
        }
    }
}
