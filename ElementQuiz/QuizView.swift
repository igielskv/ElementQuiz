//
//  QuizView.swift
//  ElementQuiz
//
//  Created by Manoli on 12/09/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var quiz: ElementQuizViewModel = ElementQuizViewModel()
    
    @State var textFiled: String = ""
    
    var body: some View {
        VStack(spacing: 30.0) {
            Text("Quiz Mode")
            
            ElementTagView(element: quiz.currentElement)
            
            Text(quiz.answer ?? " ")
                .fontWeight(.bold)
                .font(.system(size: 24.0))
            
            TextField("Your Answer", text: $textFiled, onCommit: submitAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width: 140.0)
            
            Button("Next Element") {
                self.quiz.nextElement()
                self.textFiled = ""
            }
        }
    }
    
    func submitAnswer() {
        quiz.usersAnswer = textFiled
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
