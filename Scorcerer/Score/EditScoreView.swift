//
//  EditScoreView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

struct EditScoreView: View {
    @Binding var score: Int
    @State var playerName: String

    var body: some View {
        VStack(spacing: 0) {
            Text(playerName)
                .fontStyle(.bold, .medium)
                .foregroundStyle(.caviar)
            Spacer()
                .frame(height: 30)
            // MARK: Increment by 1
            HStack(spacing: 32) {
                Button {
                    score -= 1
                } label: {
                    Text("-")
                }
                .buttonStyle(ScorcererButtonStyle())
                
                Text("\(score)")
                    .fontStyle(.bold, .xlarge)
                    .foregroundStyle(.caviar)
                
                Button {
                    score += 1
                } label: {
                    Text("+")
                        
                }
                .buttonStyle(ScorcererButtonStyle())
            }
            
            // MARK: Increment by other
            HStack {
                Button {
                    score += 5
                } label: {
                    Text("+ 5")
                }
                .buttonStyle(ScorcererButtonStyle(width: 100))
                
                Spacer()

                Button {
                    score += 10
                } label: {
                    Text("+ 10")
                }
                .buttonStyle(ScorcererButtonStyle(width: 100))
                
                Spacer()

                Button {
                    score += 20
                } label: {
                    Text("+ 20")
                }
                .buttonStyle(ScorcererButtonStyle(width: 100))
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
            
            CalculatorView(
                score: $score
            )
            .padding(.bottom, 30)
        }
        .presentationDetents([.height(600)])
    }
}

struct EditScore_Preview: PreviewProvider {
    static var previews: some View {
        EditScoreView(score: .constant(12), playerName: "Maddie")
    }
}
