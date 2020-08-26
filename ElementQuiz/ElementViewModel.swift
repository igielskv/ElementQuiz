//
//  ElementViewModel.swift
//  ElementQuiz
//
//  Created by Manoli on 26/08/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

class ElementViewModel: ObservableObject {
    let elementList: [Element] = [
        Element(id: "C", number: 6, color: .systemGreen, name: "Carbon"),
        Element(id: "Cl", number: 17, color: .systemPurple, name: "Chlorine"),
        Element(id: "Na", number: 11, color: .systemRed, name: "Sodium")
    ]
    
    @Published var currentElementIndex: Int = 0
    
    var currentElement: Element {
        elementList[currentElementIndex]
    }
    
    func nextElement() {
        if currentElementIndex < elementList.count - 1 {
            currentElementIndex += 1
        }
    }
}
