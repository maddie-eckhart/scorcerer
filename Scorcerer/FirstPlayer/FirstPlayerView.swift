//
//  FirstPlayerView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 6/9/25.
//

import SwiftUI

struct FirstPlayerView: View {
    @State private var touches: [TouchPoint] = []
    @State private var selectedTouchID: UUID? = nil
    @State private var animate = false

    var body: some View {
        ZStack {
            TouchView(touches: $touches)
                .edgesIgnoringSafeArea(.all)

            ForEach(touches) { touch in
                Circle()
                    .fill(touch.color)
                    .frame(width: selectedTouchID == touch.id && animate ? 2000 : 200,
                           height: selectedTouchID == touch.id && animate ? 2000 : 200)
                    .position(touch.location)
                    .animation(.easeOut(duration: 1), value: animate)
            }

            VStack {
                Spacer()
                Button("Pick First Player") {
                    if let randomTouch = touches.randomElement() {
                        selectedTouchID = randomTouch.id
                        animate = true
                    }
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding(.bottom, 40)
            }
        }
    }
}
