//
//  ContentView.swift
//  HighRollers
//
//  Created by Felipe Silva de Borba on 26/05/23.
//

import SwiftUI

struct ContentView: View {
    let diceTypes = [4, 6, 8, 10, 12, 20, 100]
    
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled

    @AppStorage("selectedDiceType") var selectedDiceType = 6
    @AppStorage("numberToRoll") var numberToRoll = 4
    
    @State private var currentResult = DiceResult(type: 0, number: 0)
    
    let timer = Timer.publish(every: 0.1, tolerance: 0.1, on: .main, in: .common).autoconnect()
    @State private var stoppedDice = 0
    
    @State private var feedback = UIImpactFeedbackGenerator(style: .rigid)
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedRolls.json")
    @State private var savedResults = [DiceResult]()
    
    let columns: [GridItem] = [
        .init(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Type of dice", selection: $selectedDiceType) {
                        ForEach(diceTypes, id: \.self) { type in
                            Text("D\(type)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Stepper("Number of dice: \(numberToRoll)", value: $numberToRoll, in: 1...20)
                    
                    Button("Roll them!", action: rollDice)
                } footer: {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<currentResult.rolls.count, id: \.self) { rollNumber in
                            Text(String(currentResult.rolls[rollNumber]))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                                .font(.title)
                                .padding(5)
                        }
                    }
                    .accessibilityElement()
                    .accessibilityLabel("Latest roll: \(currentResult.description)")
                }
                .disabled(stoppedDice < currentResult.rolls.count)
                
                if savedResults.isEmpty == false {
                    Section("Previous results") {
                        ForEach(savedResults) { result in
                            VStack(alignment: .leading) {
                                Text("\(result.number) x D\(result.type)")
                                    .font(.headline)
                                
                                Text(result.description)
                            }
                            .accessibilityElement()
                            .accessibilityLabel("\(result.number) D\(result.type), \(currentResult.description)")
                        }
                    }
                }
            }
            .navigationTitle("High Rollers")
            .onReceive(timer) { date in
                updateDice()
            }
            .onAppear(perform: load)
        }
    }
    
    func rollDice() {
        currentResult = DiceResult(type: selectedDiceType, number: numberToRoll)
        
        if voiceOverEnabled {
            stoppedDice = numberToRoll
            savedResults.insert(currentResult, at: 0)
            save()
        } else {
            stoppedDice = -10
        }
    }
    
    func updateDice() {
        guard stoppedDice < currentResult.rolls.count else { return }
        
        for i in stoppedDice..<numberToRoll {
            // this have different behaivior
            //guard i > 0 else { continue }
            if i < 0 { continue }
            
            currentResult.rolls[i] = Int.random(in: 1...selectedDiceType)
        }
        
        feedback.impactOccurred()
        stoppedDice += 1
        
        if stoppedDice == numberToRoll {
            savedResults.insert(currentResult, at: 0)
            save()
        }
    }
    
    // can I move this to documents directory with generics?
    func load() {
        if let data = try? Data(contentsOf: savePath) {
            if let results = try? JSONDecoder().decode([DiceResult].self, from: data) {
                savedResults = results
            }
        }
    }

    // can I move this to documents directory with generics?
    func save() {
        if let data = try? JSONEncoder().encode(savedResults) {
            try? data.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
