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
    
    var body: some View {
        VStack(spacing: 30.0) {
            VStack(spacing: -10.0) {
                Text(quiz.currentElement.id)
                    .fontWeight(.semibold)
                    .font(.system(size: 80.0))
                    .padding(.top, -10.0)
                Text("\(quiz.currentElement.number)")
                    .fontWeight(.semibold)
                    .font(.system(size: 30.0))
            }
            .frame(width: 140.0, height: 140.0)
            .foregroundColor(Color(.systemGray6))
            .background(Color(quiz.currentElement.color))
            
            Text(quiz.answer)
                .fontWeight(.bold)
                .font(.system(size: 24.0))
            
            HStack(spacing: 50.0) {
                Button(action: quiz.showAnswer) {
                    Text("Show Answer")
                }
                Button(action: quiz.nextElement) {
                    Text("Next Element")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
