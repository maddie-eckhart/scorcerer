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
                Text("Berry")
                    .foregroundStyle(.caviar)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.berry)
            
            Button {
                
            } label: {
                Spacer()
                Text("Banana")
                    .foregroundStyle(.caviar)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.banana)
            
            Button {
                
            } label: {
                Spacer()
                Text("Mint")
                    .foregroundStyle(.caviar)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.mint)
            
            Button {
                
            } label: {
                Spacer()
                Text("Avocado")
                    .foregroundStyle(.caviar)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.avocado)
            
            Button {
                
            } label: {
                Spacer()
                Text("Caviar")
                    .foregroundStyle(.white)
                    .padding(.all, 24)
                Spacer()
            }
            .background(.caviar)
            
            Text("TextDark")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.caviar)
        }
    }
}
