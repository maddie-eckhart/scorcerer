//
//  ScorcererApp.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

@main
struct ScorcererApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ScorcererViewModel())
        }
    }
}
