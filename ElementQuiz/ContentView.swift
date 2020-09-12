//
//  ContentView.swift
//  ElementQuiz
//
//  Created by Manoli on 12/09/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import SwiftUI

enum Mode: String, CaseIterable {
    case flashCard = "Flash Card"
    case quiz = "Quiz"
}

struct ContentView: View {
    
    @State var mode: Mode = .flashCard
    
    var body: some View {
        VStack {
            ModePicker(mode: $mode)
            
            if mode == .flashCard {
                Text("Flasch Card Mode")
            } else {
                Text("Quiz Mode")
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ModePicker: View {
    
    @Binding var mode: Mode
    
    var body: some View {
        Picker(selection: $mode, label: Text("Mode")) {
            ForEach(Mode.allCases, id: \.self) { mode in
                Text(mode.rawValue).tag(mode)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
