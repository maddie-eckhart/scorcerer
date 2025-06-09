//
//  HeaderView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 12/28/24.
//

import SwiftUI

enum TabType {
    case score, firstPlayer
}
struct HeaderView: View {
    var type: TabType
    var action: () -> Void
    
    var body: some View {
        HStack {
            Image("avocado-spark")
                .resizable()
                .frame(width: 40, height: 30)
                .padding(.bottom, 8)
            Text("Scorcerer")
                .fontStyle(.title, .large)
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            
            Spacer()
            
            Image("lime-spark")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
            
            if type == .score {
                Button {
                    action()
                } label: {
                    Image(systemName: "decrease.indent")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.white)
                        .frame(width: 24, height: 18)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .background(.caviar)
    }
}
