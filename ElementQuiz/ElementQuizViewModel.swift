//
//  ElementQuizViewModel.swift
//  ElementQuiz
//
//  Created by Manoli on 12/09/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import Foundation

class ElementQuizViewModel: ObservableObject {
    
    let elementList: [Element]
    
    var currentElementIndex: Int = 0
    
    @Published var currentElement: Element!
    @Published var answer: String?
    @Published var finished: Bool = false
    
    var correctAnswerCount: Int = 0
    
    var usersAnswer: String? {
        didSet {
            checkAnswer()
        }
    }
    
    init(elementList: [Element]) {
        self.elementList = elementList
        currentElementUpdate()
    }
    
    func nextElement() {
        currentElementIndex += 1
        
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
            if usersAnswer != nil {
                finished = true
                return
            }
        }
        
        currentElementUpdate()
        answer = nil
    }
    
    func currentElementUpdate() {
        currentElement = elementList[currentElementIndex]
    }
    
    func showAnswer() {
        answer = currentElement.name
    }
    
    func checkAnswer() {
        if usersAnswer?.lowercased().hasPrefix(currentElement.name.lowercased()) == true  {
            correctAnswerCount += 1
            answer = "Correct!"
        } else {
            answer = "❌\nCorrect Answer: " + currentElement.name
        }
    }
    
    func reset() {
        finished = false
        correctAnswerCount = 0
    }
}
