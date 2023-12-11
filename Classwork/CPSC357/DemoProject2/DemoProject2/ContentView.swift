//
//  ContentView.swift
//  DemoProject2
//
//  Created by Tyler Kay on 9/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .foregroundColor(Color.green)
                .foregroundColor(Color.yellow)
                .imageScale(.large)
                
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
