//
//  ContentView.swift
//  MathGame
//
//  Created by Apiphoom Chuenchompoo on 30/8/2566 BE.
//

import SwiftUI


struct ContentView: View {
    @State private var number1 = Int.random(in: 1...10)
    @State private var number2 = Int.random(in: 1...10)
    
    @State private var userAnswer: String = ""
    @State private var isCorrect: Bool? = nil
    
    var correctAnswer: Int {
        return number1 * number2
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Guess the answer:")
            Text("\(number1) × \(number2) = ?")
                .font(.largeTitle)
            
            TextField("Your answer", text: $userAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Button("Check Answer") {
                if let userInt = Int(userAnswer), userInt == correctAnswer {
                    isCorrect = true
                } else {
                    isCorrect = false
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            if let correct = isCorrect {
                if correct {
                    Text("Correct!")
                        .foregroundColor(.green)
                } else {
                    Text("Wrong! Try again.")
                        .foregroundColor(.red)
                }
            }
            
            Button("Next") {
                number1 = Int.random(in: 1...10)
                number2 = Int.random(in: 1...10)
                userAnswer = ""
                isCorrect = nil
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
