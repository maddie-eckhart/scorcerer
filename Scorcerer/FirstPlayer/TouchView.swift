//
//  TouchView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 6/9/25.
//

import SwiftUI

struct TouchView: UIViewRepresentable {
    @Binding var touches: [TouchPoint]

    func makeUIView(context: Context) -> TouchTrackingUIView {
        let view = TouchTrackingUIView()
        view.touchCallback = { newTouches in
            DispatchQueue.main.async {
                self.touches = newTouches
            }
        }
        return view
    }

    func updateUIView(_ uiView: TouchTrackingUIView, context: Context) {}
}
