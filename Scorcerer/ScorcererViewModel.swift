//
//  ScorcererViewModel.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 5/22/24.
//

import Foundation

class ScorcererViewModel: ObservableObject {
    @Published var playerList: [Player]
    
    let test: [Player] = [
        Player(name: "Maddie", score: 12),
        Player(name: "Spencer", score: 40),
        Player(name: "Katy", score: 231),
        Player(name: "Alexandra", score: 9)
    ]

    init(playerList: [Player] = []) {
        self.playerList = test
    }
    
    func filter() {
        playerList.sort{$0.score > $1.score}
    }
}

struct Player: Identifiable {
    var id: UUID = UUID()
    var name: String
    var score: Int
}
