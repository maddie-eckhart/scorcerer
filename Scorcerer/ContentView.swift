//
//  ContentView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ScorcererViewModel

    @State var showAddPlayerOverlay: Bool = false
    @State var newPlayerName: String = ""

    var body: some View {
        VStack {
            header
                .padding(.all, 24)
            List {
                ForEach($viewModel.playerList, id: \.id) { $player in
                    PlayerView(player: $player)
                        .padding(.vertical, 8)
                }
                .onDelete { index in
                    viewModel.playerList.remove(atOffsets: index)
                }
            }
            .listStyle(.inset)
            
            Spacer()

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
            .background(.black.opacity(0.2))
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
            Text("Players")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundStyle(.caviar)

            Spacer()
            
            Button {
                viewModel.filter()
                print("sorted")
            } label: {
                Image(systemName: "decrease.indent")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.caviar)
                    .frame(width: 24, height: 18)
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        let test: [Player] = [
            Player(id: .init(), name: "Maddie", score: 12),
            Player(id: .init(), name: "Spencer", score: 40),
            Player(id: .init(), name: "Katy", score: 231),
            Player(id: .init(), name: "Alexandra", score: 9)
        ]
        
        ContentView(viewModel: ScorcererViewModel(playerList: test))
    }
}
