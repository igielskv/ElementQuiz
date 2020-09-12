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
    @State var textFieldDisabled: Bool = false
    
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
                .disabled(textFieldDisabled)
            
            Button(quiz.currentElementIndex == quiz.elementList.count - 1 ? "Show Score" : "Next Question") {
                self.quiz.nextElement()
                self.clearTextFiled()
            }
            .disabled(quiz.answer == nil)
        }
        .alert(isPresented: $quiz.finished) {
            Alert(title: Text("Quiz Score"), message: Text("Your score is \(quiz.correctAnswerCount) out of \(quiz.elementList.count)."), dismissButton: .default(Text("OK"), action: scoreDismissed))
        }
    }
    
    func submitAnswer() {
        quiz.usersAnswer = textFiled
        textFieldDisabled = true
    }
    
    func scoreDismissed() {
        quiz.reset()
        clearTextFiled()
    }
    
    func clearTextFiled() {
        textFiled = ""
        textFieldDisabled = false
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
