//
//  EditScoreView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

struct EditScoreView: View {
    @Binding var score: Int
    @State var calculatorInput: String = "0"
    @State var operation: MathOperation = .none
    
    var isButtonDisabled: Bool {
        calculatorInput == "0" || operation == .none
    }

    var body: some View {
        VStack(spacing: 0) {
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
                input: $calculatorInput,
                operation: $operation
            )
            
            Button {
                switch operation {
                case .none:
                    break
                case .add:
                    score += Int(calculatorInput) ?? 0
                case .subtract:
                    score -= Int(calculatorInput) ?? 0
                }
                operation = .none
                calculatorInput = "0"
                
            } label: {
                HStack {
                    Spacer()
                    Text("Done")
                        .fontStyle(.bold, .small)
                        .foregroundStyle(.caviar)
                        .padding(.all, 12)
                    Spacer()
                }
            }
            .disabled(isButtonDisabled)
            .background(isButtonDisabled ? .black.opacity(0.2) : .white)
        }
        .presentationDetents([.height(600)])
    }
}

struct EditScore_Preview: PreviewProvider {
    static var previews: some View {
        EditScoreView(score: .constant(12))
    }
}

/// TODO:
/// - reusable button
/// - width when horizontal
