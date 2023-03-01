//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Felipe Silva de Borba on 28/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0;
    @State private var playsCount = 0;
    @State private var showingGameOver = false
    
    private let moves = ["rock", "paper", "scissors"]
    let p1p2move = [
        "rock": ["rock": false, "paper": true, "scissors": false],
        "paper": ["rock": false, "paper": false, "scissors": true],
        "scissors": ["rock": true, "paper": false, "scissors": false]
    ]
    
    struct SpacerFixed: View {
        var body: some View {
            Spacer().frame(height: 15.0)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SpacerFixed()
                
                Text("Player Score: \(score)")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("You should \(shouldWin ? "win" : "lose")")
                    .font(.title2)
                
                SpacerFixed()
                
                Text(moves[currentMove])
                    .font(.title)
                    .fontWeight(.semibold)
                
                SpacerFixed()
                
                HStack {
                    Button("Rock") {
                        checkPlayerChoice(0)
                    }
                    Button("Paper") {
                        checkPlayerChoice(1)
                    }
                    Button("Scissors") {
                        checkPlayerChoice(2)
                    }
                }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Rock Paper Scissors")
            .alert("Game Over", isPresented: $showingGameOver) {
                Button("Play again", action: reset)
            } message: {
                Text("Our score was \(score)")
            }
        }
    }
    
    func checkPlayerChoice(_ move: Int) {
        playsCount += 1
        
        let playerMove = moves[move]
        let appMove = moves[currentMove]
        
        var didWin = p1p2move[appMove]?[playerMove] ?? false
        
        if shouldWin && !didWin {
            didWin = false
        } else {
            didWin = true
        }
        
        changeScore(didLose: !didWin)
        
        
        shuffle()
        if playsCount >= 10 {
            showingGameOver = true
        }
    }
    
    func changeScore(didLose: Bool) {
        if didLose && score > 0 {
            score -= 1
        } else if !didLose {
            score += 1
        }
    }
    
    func reset() {
        score = 0
        playsCount = 0
    }
    
    func shuffle() {
        currentMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
