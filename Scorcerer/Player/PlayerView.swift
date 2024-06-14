//
//  PlayerView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

struct PlayerView: View {
    @Binding var player: Player
    @State var showEditScoreOverlay: Bool = false

    var body: some View {

        HStack {
            Text(player.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.caviar)
            
            Spacer()

            Button {
                showEditScoreOverlay.toggle()
            } label: {
                Text("\(player.score)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.caviar)
                    .padding(.all, 12)
                    
            }
            .frame(width: 80)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(.mint, lineWidth: 6)
                    .stroke(.caviar, lineWidth: 6)
                    
            )
        }
        .sheet(isPresented: $showEditScoreOverlay) {
            EditScoreView(score: Binding<Int>(
                get: {
                    return player.score
                },
                set: { score, _ in
                    player.score = score
                }
            ))
        }
    }
}

#Preview {
    PlayerView(
        player:.constant(
            Player(
                name: "Maddie",
                score: 12
            )
        )
    )
    .padding()
}
