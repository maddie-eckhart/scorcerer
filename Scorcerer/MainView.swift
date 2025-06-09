//
//  MainView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 12/27/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ScoreView(viewModel: ScorcererViewModel())
                .tabItem {
                    Label("Scores", systemImage: "list.dash")
                }

            FirstPlayerView()
                .tabItem {
                    Label("First Player", systemImage: "person")
                }
        }
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
