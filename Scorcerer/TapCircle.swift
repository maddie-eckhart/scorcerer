//
//  TapCircle.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 6/9/25.
//

import SwiftUI

struct TapCircle: Identifiable {
    let id = UUID()
    let location: CGPoint
    let color: Color
}

struct TapToJoinView: View {
    @State private var taps: [TapCircle] = []
    @State private var selectedID: UUID? = nil
    @State private var animate = false
    
    let colors: [Color] = [.avocado, .lime, .berry, .banana, .cyan, .purple, .black, .yellow, .brown, .white]
    @State private var nextColorIndex = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.caviar
                    .ignoresSafeArea()
                    .contentShape(Rectangle())
                    .onTapGesture { location in
                        guard selectedID == nil else { return }
                        let color = colors[nextColorIndex % colors.count]
                        nextColorIndex += 1
                        taps.append(TapCircle(location: location, color: color))
                    }
                
                ForEach(taps) { tap in
                    Circle()
                        .fill(tap.color)
                        .frame(width: selectedID == tap.id && animate ? 2000 : 200,
                               height: selectedID == tap.id && animate ? 2000 : 200)
                        .opacity(selectedID == nil || selectedID == tap.id ? 1 : 0)
                        .position(tap.location)
                        .animation(.easeOut(duration: selectedID == tap.id ? 1.5 : 0), value: animate)
                }
                
                VStack {
                    Spacer()
                    if selectedID == nil {
                        Button("Pick First Player") {
                            if let winner = taps.randomElement() {
                                selectedID = winner.id
                                animate = true
                            }
                        }
                    } else {
                        Button("Reset") {
                            taps = []
                            selectedID = nil
                            animate = false
                            nextColorIndex = 0
                        }
                    }
                }
                .padding(.bottom, 40)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
