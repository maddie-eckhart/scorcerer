//
//  ContentView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

struct ScoreView: View {
    @StateObject var viewModel: ScorcererViewModel

    @State var showAddPlayerOverlay: Bool = false
    @State var newPlayerName: String = ""

    var body: some View {
        VStack(spacing: 0) {
            header
            List {
                ForEach($viewModel.playerList, id: \.id) { $player in
                    PlayerView(player: $player)
                        .padding(.vertical, 8)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.playerList.removeAll(where: { $0.id == $player.id })
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                            
                            Button {
                                viewModel.clearScore(of: player)
                            } label: {
                                Text("Clear")
                            }
                            .tint(.gray)
                        }
                }
            }
            .padding(.bottom, -8)
            .listStyle(.inset)

            // MARK: Add players

            Button {
                showAddPlayerOverlay.toggle()
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.caviar)
                        .frame(width: 22, height: 22)
                    Spacer()
                }
                .padding()
            }
            .background(.banana)
            .padding(.bottom, 16)
        }
        .sheet(isPresented: $showAddPlayerOverlay) {
            AddPlayerView(
                viewModel: viewModel,
                showAddPlayerOverlay: $showAddPlayerOverlay
            )
        }
    }
    
    @ViewBuilder
    var header: some View {
        HStack {
            Image("avocado-spark")
                .resizable()
                .frame(width: 40, height: 30)
                .padding(.bottom, 8)
            Text("Scorcerer")
                .fontStyle(.title, .large)
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            
            Spacer()
            
            Image("lime-spark")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
            
            Button {
                viewModel.filter()
            } label: {
                Image(systemName: "decrease.indent")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.white)
                    .frame(width: 24, height: 18)
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .background(.caviar)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        let test: [Player] = [
            Player(name: "Maddie", score: 12),
            Player(name: "Spencer", score: 40),
            Player(name: "Katy", score: 231),
            Player(name: "Alexandra", score: 9)
        ]
        
        ScoreView(viewModel: ScorcererViewModel(playerList: test))
    }
}
