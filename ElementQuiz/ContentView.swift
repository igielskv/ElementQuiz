//
//  ContentView.swift
//  ElementQuiz
//
//  Created by Manoli on 25/08/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var quiz = ElementViewModel()
    
    @State var textField: String = ""
    
    var body: some View {
        VStack(spacing: 30.0) {
            
            Picker(selection: $quiz.mode, label: Text("Mode")) {
                Text("Flash Card").tag(Mode.flashCard)
                Text("Quiz").tag(Mode.quiz)
            }
            .frame(width: 200.0)
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom)
            
            ElementTagView(element: quiz.currentElement)
            
            Text(quiz.answer)
                .fontWeight(.bold)
                .font(.system(size: 24.0))
            
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $quiz.usersAnswer, onCommit: quiz.checkAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 140.0)
                .opacity(quiz.mode == .quiz ? 1 : 0)
            
            HStack(spacing: 50.0) {
                Button(action: quiz.showAnswer) {
                    Text("Show Answer")
                }
                Button(action: quiz.nextElement) {
                    Text("Next Element")
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
