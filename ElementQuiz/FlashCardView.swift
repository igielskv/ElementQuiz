//
//  FlashCardView.swift
//  ElementQuiz
//
//  Created by Manoli on 12/09/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

struct FlashCardView: View {
    @ObservedObject var flashCards: ElementQuizViewModel = ElementQuizViewModel(elementList: fixedElementList)
    
    var body: some View {
        VStack(spacing: 30.0) {
            Text("Flash Card Mode")
            
            ElementTagView(element: flashCards.currentElement)
            
            Text(flashCards.answer ?? "?")
                .fontWeight(.bold)
                .font(.system(size: 24.0))
            
            HStack(spacing: 50.0) {
                Button("Show Answer") {
                    self.flashCards.showAnswer()
                }
                
                Button("Next Element") {
                    self.flashCards.nextElement()
                }
            }
        }
    }
}

struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardView()
    }
}
