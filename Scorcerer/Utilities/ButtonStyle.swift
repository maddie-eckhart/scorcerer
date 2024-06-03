//
//  ButtonStyle.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/24/24.
//

import SwiftUI

struct ScorcererButtonStyle: ButtonStyle {
    var width: CGFloat = 60
    var height: CGFloat = 60
    var filled: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        if filled {
            configuration.label
                .font(.title)
                .fontWeight(.bold)
                .padding(.all, 12)
                .foregroundStyle(.textDark)
                .frame(width: width, height: height)
                .background(.bright.opacity(0.4))
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
        } else {
            configuration.label
                .font(.title)
                .fontWeight(.bold)
                .padding(.all, 12)
                .foregroundStyle(.textDark)
                .frame(maxWidth: width, maxHeight: height)
                .background(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.accent2, lineWidth: 3)
                )
        }
    }
}

struct ToggleButtonStyle: ButtonStyle {
    var toggled: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.bold)
            .padding(.all, 12)
            .foregroundStyle(.textDark)
            .frame(maxWidth: 60, maxHeight: .infinity)
            .background(toggled ? .bright.opacity(0.5) : .white.opacity(0.7))
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            )
    }
}

struct ScorcererButtonStyle_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                
            } label: {
                Text("+ 10")
            }
            .buttonStyle(ScorcererButtonStyle(width: 100))
            
            Button {
                
            } label: {
                Text("+ 11")
            }
            .buttonStyle(ScorcererButtonStyle(width: 100, filled: false))
            
            Button {
                
            } label: {
                Text("+ 12")
            }
            .buttonStyle(ToggleButtonStyle(toggled: false))
        }
    }
}
