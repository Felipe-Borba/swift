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
    
    @State private var flagsAnimation = [0.0, 0.0, 0.0]
    @State private var buttonsFade = [false, false, false]
    @State private var scaleEffectAmount = 1.0
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    struct FlagImage: View {
        let contry: String
        
        var body: some View {
            Image(contry)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }
    
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
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 3)) {
                                flagsAnimation[number] += 360
                                var faded: [Bool] = []
                                for (index, _) in buttonsFade.enumerated() {
                                    if index == number {
                                        faded.append(false)
                                    } else {
                                        faded.append(true)
                                    }
                                }
                                buttonsFade = faded
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
                                withAnimation(.easeIn) {
                                    scaleEffectAmount = 0
                                    flagTapped(number)
                                }
                                buttonsFade = [false, false, false]
                            }
                        } label: {
                            FlagImage(contry: countries[number])
                                .rotation3DEffect(.degrees(flagsAnimation[number]), axis: (x: 0, y: 1, z: 0))
                                .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        }
                        .opacity(buttonsFade[number] ? 0.25 : 1)
                        .animation(.easeIn, value: buttonsFade[number])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scaleEffect(scaleEffectAmount)

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
            Button("Continue") {
                withAnimation(.easeOut) {
                    scaleEffectAmount = 1
                    askQuestion()
                }
            }
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
