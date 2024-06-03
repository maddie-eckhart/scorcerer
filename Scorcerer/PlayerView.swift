//
//  PlayerView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

struct PlayerView: View {
    @State var player: Player
    @State var showEditScoreOverlay: Bool = false

    var body: some View {

        HStack {
            Text(player.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.textDark)
            
            Spacer()

            Button {
                showEditScoreOverlay.toggle()
            } label: {
                Text("\(player.score)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.textDark)
                    .padding(.all, 12)
                    
            }
            .frame(width: 80)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(.accent1, lineWidth: 6)
                    .stroke(.bright, lineWidth: 6)
                    
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
        player:
            Player(
                id: .init(),
                name: "Maddie",
                score: 12
            )
    )
    .padding()
}
