//
//  Color.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import SwiftUI

struct Scolor_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                
            } label: {
                Spacer()
                Text("Light")
                    .foregroundStyle(.textDark)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.light)
            
            Button {
                
            } label: {
                Spacer()
                Text("Bright")
                    .foregroundStyle(.textDark)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.bright)
            
            Button {
                
            } label: {
                Spacer()
                Text("Accent1")
                    .foregroundStyle(.textDark)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.accent1)
            
            Button {
                
            } label: {
                Spacer()
                Text("Accent2")
                    .foregroundStyle(.textDark)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.accent2)
            
            Text("TextDark")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.textDark)
        }
    }
}
