//
//  ElementViewModel.swift
//  ElementQuiz
//
//  Created by Manoli on 26/08/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

class ElementViewModel: ObservableObject {
    
    init() {
        mode = .flashCard
        answer = "?"
    }
    
    let elementList: [Element] = [
        Element(id: "C", number: 6, color: .systemGreen, name: "Carbon"),
        Element(id: "Cl", number: 17, color: .systemPurple, name: "Chlorine"),
        Element(id: "Na", number: 11, color: .systemRed, name: "Sodium")
    ]
    
    private var currentElementIndex: Int = 0
    
    var currentElement: Element {
        elementList[currentElementIndex]
    }
    
    var mode: Mode {
        didSet {
            clearAnswer()
        }
    }
    
    @Published var answer: String
    
    func clearAnswer() {
        if mode == .flashCard {
            answer = "?"
        } else {
            answer = " "
            usersAnswer = ""
        }
    }
    
    func showAnswer() {
        answer = currentElement.name
    }
    
    func nextElement() {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
        }
        
        clearAnswer()
    }
    
    var usersAnswer: String = ""
    var correctAnswerCount: Int = 0
    
    func checkAnswer() {
        if usersAnswer.lowercased() == currentElement.name.lowercased() {
            correctAnswerCount += 1
            answer = "Correct!"
        } else {
            answer = "❌"
        }
    }
}

enum Mode {
    case flashCard, quiz
}
