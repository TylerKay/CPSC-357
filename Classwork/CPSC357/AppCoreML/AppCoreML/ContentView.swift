//
//  ContentView.swift
//  AppCoreML
//
//  Created by Tyler Kay on 12/5/23.
//

import Foundation
import SwiftUI
import CoreML
import NaturalLanguage

class SpamIdentifer : ObservableObject {
    @Published var prediction = ""
    @Published var confidence = 0.0
    
    var model = MLModel()
    var spamPredictor = NLModel()
    
    init(){
        do {
            self.spamPredictor = try NLModel(mlModel: SpamClassifer().model)
        } catch {
            print(error)
        }
    }
    
    func predict(_ text: String){
        self.prediction = spamPredictor.predictedLabel(for: text) ?? ""
        let predictionSet = spamPredictor.predictedLabelHypotheses(for: text, maximumCount: 1)
                                                                   self.confidence = predictionSet[prediction] ?? 0.0
                                                    
    }
}





struct ContentView: View {
    @ObservableObject var identifer = SpamIdentifer()
    @State private var input = "Enter Message"
    
    var body: some View {
        VStack (alignment: .center) {
            Spacer()
            Text(self.identifer.prediction=="spam" ? "SPAM": "NOT SPAM")
                .font(.system(size: 60))
            Text("Confidence: \(self.identifer.confidence)")
            TextEditor(text: $input)
                .font(.title)
                .onChange(of: input){_ in
                    if input.last == " "{
                        self.identifer.predict(input)
                    }
                }
            Spacer()
        }
    }
            
}

#Preview {
    ContentView()
}
