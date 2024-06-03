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
                ForEach(viewModel.playerList, id: \.id) { player in
                    PlayerView(player: player)
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
                        .foregroundStyle(.textDark)
                        .frame(width: 22, height: 22)
                    Spacer()
                }
                .padding()
            }
            .background(.black.opacity(0.2))
        }
        .sheet(isPresented: $showAddPlayerOverlay) {
            newPlayerOverlay
        }
    }
    
    @ViewBuilder
    var header: some View {
        HStack {
            Text("Players")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundStyle(.textDark)

            Spacer()
            
            Button {
                viewModel.filter()
                print("sorted")
            } label: {
                Image(systemName: "decrease.indent")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.textDark)
                    .frame(width: 24, height: 18)
            }
        }
    }

    @ViewBuilder
    var newPlayerOverlay: some View {
        VStack {
            TextField(
                "Name",
                text: $newPlayerName
            )
            .font(.title2)
            .onSubmit {
                self.viewModel.playerList.append(
                    Player(
                        id: .init(),
                        name: newPlayerName,
                        score: 0)
                )
                showAddPlayerOverlay.toggle()
                newPlayerName = ""
            }
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.accent2, lineWidth: 6)
                
            )
            .padding(.top, 100)
            .padding([.horizontal, .bottom], 24)
            
            Button {
                self.viewModel.playerList.append(
                    Player(
                        id: .init(),
                        name: newPlayerName,
                        score: 0)
                )
                showAddPlayerOverlay.toggle()
                newPlayerName = ""
            } label: {
                Text("Add Player")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.textDark)
                    .padding(.all, 12)
            }
            .frame(width: 200)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(.accent2, lineWidth: 6)
                    .stroke(.accent1, lineWidth: 6)
                
            )
            Spacer()
        }
        .background(.bright)
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

/// TODO:
/// - save players?
/// - dark mode
/// - edit player
/// - autofocus keyboard
/// - little avatars?
/// - make calulator int instead of string
/// - live activities to show current scores?
/// - other tab ideas
///     - decide first player
///     - dice tracker
