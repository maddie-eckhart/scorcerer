//
//  TouchTackingUIView.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 6/9/25.
//

import SwiftUI

struct TouchPoint: Identifiable {
    var id: UUID
    var location: CGPoint
    var color: Color
}

class TouchTrackingUIView: UIView {
    var touchCallback: (([TouchPoint]) -> Void)?

    private var currentTouches: [UITouch: TouchPoint] = [:]
    private let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .pink]

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if currentTouches[touch] == nil {
                let location = touch.location(in: self)
                let color = colors[currentTouches.count % colors.count]
                currentTouches[touch] = TouchPoint(id: UUID(), location: location, color: color)
            }
        }
        touchCallback?(Array(currentTouches.values))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if var touchPoint = currentTouches[touch] {
                touchPoint.location = touch.location(in: self)
                currentTouches[touch] = touchPoint
            }
        }
        touchCallback?(Array(currentTouches.values))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            currentTouches.removeValue(forKey: touch)
        }
        touchCallback?(Array(currentTouches.values))
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
}
