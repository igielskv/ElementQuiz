//
//  ElementTagView.swift
//  ElementQuiz
//
//  Created by Manoli on 28/08/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

struct ElementTagView: View {
    var element: Element
    
    var body: some View {
        VStack(spacing: -10.0) {
            Text(element.id)
                .fontWeight(.semibold)
                .font(.system(size: 80.0))
                .padding(.top, -10.0)
            Text("\(element.number)")
                .fontWeight(.semibold)
                .font(.system(size: 30.0))
        }
        .frame(width: 140.0, height: 140.0)
        .foregroundColor(Color(.systemGray6))
        .background(Color(element.color))
    }
}

struct ElementTagView_Previews: PreviewProvider {
    static var previews: some View {
        ElementTagView(element: ElementViewModel().currentElement)
    }
}
