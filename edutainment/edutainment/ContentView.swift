//
//  ContentView.swift
//  edutainment
//
//  Created by Felipe Silva de Borba on 16/03/23.
//

import SwiftUI

struct Question {
    var multiplier: Int
    var multiplicand: Int
    var answer: Int
    var id: Int
    
    init(id: Int, maxMultiplier: Int) {
        self.id = id
        self.answer = 0
        self.multiplier = Int.random(in: 2...maxMultiplier)
        self.multiplicand = Int.random(in: 1...10)
    }
    
    func isCorrect() -> Bool {
        multiplier * multiplicand == answer
    }
}

struct ContentView: View {
    @State private var startGame = true;
    @State private var multiplicationTables = 2;
    @State private var numberOfQuestion = 5;
    let numberOfQuestions = [5, 10, 15]
    @State private var questions = Array<Question>()
    @FocusState private var amountIsFocused: Bool
    
    @State private var questionNumber = 0
    @State private var userResponse = 0
    @State private var showResultAlert = false
    @State private var showGameOver = false
    
    var body: some View {
        NavigationView {
            if startGame {
                setupScreen
                    .navigationTitle("Well Come")
            } else {
                gameScreen
                .navigationTitle("Multiplication")
            }
        }
    }
    
    var setupScreen: some View {
        VStack {
            Form {
                Section {
                    Text("Which multiplication table are you up to?")
                    Stepper("\(multiplicationTables)", value: $multiplicationTables, in: 2...12, step: 1)
                }
                
                Section {
                    Picker("How many questions?", selection: $numberOfQuestion) {
                        ForEach(numberOfQuestions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button("Done") {
                        generateQuestions()
                    }
                    Spacer()
                }
            }
        }
    }
    
    var gameScreen: some View {
        let question = questions[questionNumber]
        return VStack {
            Form {
                Text("How much is...")
                HStack {
                    Text("\(question.multiplier) X \(question.multiplicand) =")
                    TextField("Response", value: $userResponse, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                        saveResponse()
                        showResultAlert = true
                    }
                }
            }
            .alert("", isPresented: $showResultAlert) {
                Button("Continue"){
                    nextQuestion()
                    userResponse = 0
                }
            } message: {
                Text(showResponse())
            }
            .alert("Game Over", isPresented: $showGameOver) {
                Button("Ok"){
                    startGame = true
                }
            } message: {
                Text("You got \(getTotalCorrectAnswers()) questions right out of \(questions.count)")
            }
        }
    }
    
    func getTotalCorrectAnswers() -> Int {
        var totalCorrectAnswer = 0
        for question in questions {
            if question.isCorrect() {
                totalCorrectAnswer += 1
            }
        }
        return totalCorrectAnswer
    }
    
    func saveResponse() {
        questions[questionNumber].answer = userResponse
    }
    
    func showResponse() -> String {
        let question = questions[questionNumber]
        
        if question.isCorrect() {
            return "Congratulations \nyour answer is correct"
        } else {
            return "Ops, \(question.multiplier) X \(question.multiplicand) is \(question.multiplier * question.multiplicand) not \(question.answer)"
        }
    }
    
    func nextQuestion() {
        if questionNumber < questions.count - 1 {
            questionNumber += 1
            userResponse = 0
        } else {
            showGameOver = true
        }
    }
    
    func generateQuestions() {
        for id in 1...numberOfQuestion {
            questions.append(Question(id: id, maxMultiplier: multiplicationTables))
        }
        startGame = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
