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
                .font(.custom("Tahoma Bold", size: 26))
                .padding(.all, 12)
                .foregroundStyle(.caviar)
                .frame(width: width, height: height)
                .background(.lime.opacity(0.4))
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
        } else {
            configuration.label
                .font(.custom("Tahoma Bold", size: 26))
                .padding(.all, 12)
                .foregroundStyle(.caviar)
                .frame(maxWidth: width, maxHeight: height)
                .background(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.avocado, lineWidth: 3)
                )
        }
    }
}

struct ToggleButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.bold)
            .padding(.all, 12)
            .foregroundStyle(.caviar)
            .frame(maxWidth: 60, maxHeight: .infinity)
            .background(configuration.isPressed ? .avocado.opacity(0.5) : .white.opacity(0.7))
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
                Text("+")
            }
            .background(.dill)
            .buttonStyle(ToggleButtonStyle())
        }
    }
}
