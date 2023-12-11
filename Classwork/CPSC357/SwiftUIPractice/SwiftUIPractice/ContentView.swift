//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Tyler Kay on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0;
    @State private var classification: String = "";
    
    var body: some View {
        VStack {
            Text("BMI Calculator")
            
            TextField("Enter Weight (in kilograms)", text: $weightText).textFieldStyle(RoundedBorderTextFieldStyle()
            )
            
            TextField("Enter height", text: $heightText).textFieldStyle(RoundedBorderTextFieldStyle()
            )
            
            Button("Calculate BMI") {
                let weight = Double(self.weightText)!
                let height = Double(self.heightText)!
                self.bmi = weight / (height * height)
            }
            
            Text("BMI: \(bmi)")
            
            
            switch (bmi){
                case 0..<18.5:
                    self.classification = "Underweight"
                case (18.5..<24.99):
                    self.classificaiton = "Healthy Weight"
                case (25..<29.9):
                    self.classification = "Overweight"
                default:
                    self.classification = "unhealthy"
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        VStack {
//            Text("Financial Results")
//                .font(.title)
//            
//            HStack {
//                Text("Q1 Sales")
//                    .font(.headline)
//                VStack (alignment: .trailing){
//                    Text("January")
//                    Text("February")
//                    Text("March")
//                        .frame(width: 100, height: 100, alignment: .center)
//
//                }
//                Spacer()
//                VStack (alignment: .center, spacing: 50) {
//                    Text("$1000")
//                    Text("$200")
//                    Text("$3000")
//                }
//                
//            }
//        }
                
    }
}

#Preview {
    ContentView()
}
