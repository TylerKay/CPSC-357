//
//  ContentView.swift
//  Counter
//
//  Created by Tyler Kay on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    
    
    var body: some View {
        HStack {
            ZStack {
                Circle ()
                    .fill(Color.red)
                Button("Press me") {
                    print ("Button pressed")
                    self.count += 1
                }
            }
            VStack {
                Text ("Count = \(count)")
            }
            VStack {
                Button("Reset") {
                    self.count = 0
                }
            }
        }
        .frame(width: 175, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
