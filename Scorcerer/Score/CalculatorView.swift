//
//  CalculatorView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/27/24.
//

import SwiftUI

enum MathOperation {
    case none, add, subtract
}

struct CalculatorView: View {
    @Binding var score: Int
    @State var input: String = "0"
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(input)
                    .fontStyle(.bold, .large)
                    .foregroundStyle(.caviar)
            }
            .padding(.top, 16)
            .padding([.leading, .trailing], 24)
            
            HStack(spacing: 24) {
                KeyPad(string: $input)
                VStack {
                    Button {
                        score += Int(input) ?? 0
                        input = "0"
                    } label: {
                        Text("+")
                    }
                    .buttonStyle(ToggleButtonStyle())
                    
                    Button {
                        score -= Int(input) ?? 0
                        input = "0"
                    } label: {
                        Text("-")
                    }
                    .buttonStyle(ToggleButtonStyle())
                }
            }
        }
        .frame(height: 326)
        .padding(.bottom, 16)
        .background(.dill)
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        CalculatorView(
            score: .constant(5)
        )
    }
}

// MARK: Buttons

struct NumButton: View {
    @Environment(\.numButtonAction) var action: (String) -> Void

    enum ActionKey: EnvironmentKey {
        static var defaultValue: (String) -> Void { { _ in } }
    }

    var key: String

    var body: some View {
        Button {
            self.action(self.key)
        } label: {
            Text(key)
        }
        .buttonStyle(ScorcererButtonStyle(width: 80, filled: false))
    }
}

extension EnvironmentValues {
    var numButtonAction: (String) -> Void {
        get { self[NumButton.ActionKey.self] }
        set { self[NumButton.ActionKey.self] = newValue }
    }
}

struct KeyPadButton_Previews: PreviewProvider {
    static var previews: some View {
        NumButton(key: "8")
            .padding()
            .frame(width: 80, height: 80)
            .previewLayout(.sizeThatFits)
    }
}

// MARK: Rows

struct KeyPadRow: View {
    var keys: [String]

    var body: some View {
        HStack {
            ForEach(keys, id: \.self) { key in
                 NumButton(key: key)
            }
        }
    }
}

// MARK: Key Pad

struct KeyPad: View {
    @Binding var string: String

    var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: [".", "0", "←"])
        }.environment(\.numButtonAction, self.keyWasPressed(_:))
    }

    private func keyWasPressed(_ key: String) {
        switch key {
        case "." where string.contains("."): break
        case "." where string == "0": string += key
        case "←":
            string.removeLast()
            if string.isEmpty { string = "0" }
        case _ where string == "0": string = key
        default: string += key
        }
    }
}
