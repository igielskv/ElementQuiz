//
//  ElementQuizViewModel.swift
//  ElementQuiz
//
//  Created by Manoli on 12/09/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import Foundation

class ElementQuizViewModel: ObservableObject {
    
    let elementList: [Element] = [
        Element(id: "C", number: 6, color: .systemGreen, name: "Carbon"),
        Element(id: "Cl", number: 17, color: .systemPurple, name: "Chlorine"),
        Element(id: "Na", number: 11, color: .systemRed, name: "Sodium")
    ]
    
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
    
    init() {
        currentElementUpdate()
    }
    
    func nextElement() {
        currentElementIndex += 1
        
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
            finished = true
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
            answer = "❌"
        }
    }
    
    func reset() {
        finished = false
        correctAnswerCount = 0
    }
}
