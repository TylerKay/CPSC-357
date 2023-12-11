//
//  ContentView.swift
//  StateExample2
//
//  Created by Tyler Kay on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    @State private var colorIndex = 0
    
    @State private var rotation: Double = 0
    @State private var inputText: String = ""
    
    var body: some View {
        
        VStack {
            Text("Hello, world!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut, value: 5)
                .foregroundColor(colors[colorIndex])
            
            
            Slider(value: $rotation, in: 0 ... 360, step: 0.2)
            
            TextField("Enter Text Here", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
//            Picker(selection:
//                    .constant(1), label:
//                    Text("Picker")) {
//                Text("1").tag(1)
//                Text("2").tag(2)
//            }
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colornames.count) { color in
                    Text(colornames[color])
                        .foregroundColor(colors[color])
                }
            }.pickerStyle(.wheel)
        }
        
    }
}

#Preview {
    ContentView()
}
