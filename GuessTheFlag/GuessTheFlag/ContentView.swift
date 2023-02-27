//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Felipe Silva de Borba on 23/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scorePoint = 0
    
    @State private var showingGameOver = false
    
    @State private var round = 0
    private let MAX_ROUND = 8
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(scorePoint)")
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(scorePoint)")
        }
        .alert("Game Over", isPresented: $showingGameOver) {
            Button("Play again", action: reset)
        } message: {
            if(scorePoint == MAX_ROUND) {
                Text("You gessed all flags correctly!")
            } else {
                Text("You gessed \(scorePoint) of \(MAX_ROUND) flags correctly!")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scorePoint += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
        }

        round += 1
        if round < MAX_ROUND {
            showingScore = true
        } else {
            showingGameOver = true
        }
    }
    
    func reset() {
        round = 0
        scorePoint = 0
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        let oldAnswer = correctAnswer
        correctAnswer = Int.random(in: 0...2)
        if correctAnswer == oldAnswer {
            askQuestion()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
