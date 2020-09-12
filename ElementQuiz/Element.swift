//
//  Element.swift
//  ElementQuiz
//
//  Created by Manoli on 26/08/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

struct Element {
    let id: String
    let number: Int
    let color: UIColor
    let name: String
}

let fixedElementList: [Element] = [
    Element(id: "C", number: 6, color: .systemGreen, name: "Carbon"),
    Element(id: "Au", number: 79, color: .systemYellow, name: "Gold"),
    Element(id: "Cl", number: 17, color: .systemPurple, name: "Chlorine"),
    Element(id: "Na", number: 11, color: .systemRed, name: "Sodium")
]
