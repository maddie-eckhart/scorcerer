//
//  AddPlayerView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 6/6/24.
//

import SwiftUI

struct AddPlayerView: View {
    enum FocusedField {
        case name
    }

    @StateObject var viewModel: ScorcererViewModel
    @Binding var showAddPlayerOverlay: Bool

    @State private var newPlayerName = ""
    
    @FocusState private var focusedField: FocusedField?

    var body: some View {
        VStack {
            TextField("Name", text: $newPlayerName)
            .font(.title2)
            .onSubmit {
                self.viewModel.playerList.append(
                    Player(
                        name: newPlayerName,
                        score: 0)
                )
                showAddPlayerOverlay.toggle()
                newPlayerName = ""
            }
            .focused($focusedField, equals: .name)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.lime, lineWidth: 6)
                
            )
            .padding(.top, 100)
            .padding([.horizontal, .bottom], 24)
            
            Button {
                self.viewModel.playerList.append(
                    Player(
                        name: newPlayerName,
                        score: 0)
                )
                showAddPlayerOverlay.toggle()
                newPlayerName = ""
            } label: {
                Text("Add Player")
                    .fontStyle(.bold, .small)
                    .foregroundStyle(.caviar)
                    .padding(.all, 12)
            }
            .frame(width: 200)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(.lime, lineWidth: 6)
                    .stroke(.avocado, lineWidth: 6)
                
            )
            Spacer()
        }
        .background(.caviar)
        .onAppear {
            focusedField = .name
        }
    }
}
