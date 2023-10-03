//
//  ContentView.swift
//  CardPresentation1
//
//  Created by Tyler Kay on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Tyler Kay")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding()
                
        }
        
        .padding(30)
        VStack {
            Text("tkay@chapman.edu")
                .fontWeight(.thin)
                .foregroundColor(Color.blue)
                .padding(30)
                .border(.black, width: 2)
        }.padding(5)
        VStack {
            Text("Computer Science Major, ISP Minor")

                .fontWeight(.thin)
                .foregroundColor(Color.blue)
                .padding(30)
                .border(.black, width: 2)
            
        }.padding(5)
        VStack {
            Text("Senior, Class of 2024")
                .fontWeight(.thin)
                .foregroundColor(Color.blue)
                .padding(30)
                .border(.black, width: 2)
        }.padding(5)
    }
}

#Preview {
    ContentView()
}
