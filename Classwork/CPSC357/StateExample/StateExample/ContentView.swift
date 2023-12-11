//
//  ContentView.swift
//  StateExample
//
//  Created by Tyler Kay on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    @State var pokemonName = ""
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(width: UIScreen.main.bounds.width,
                       height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .padding(10)
            
            Button(
                action: {self.switchName()},
                label: {Text ("I will make a change")})
        }
        .padding()
    }
    func switchName () {
        let pokemonList = ["Squirtle", "Charmander", "Bulbasaur", "Pikachu"]
        self.pokemonName = pokemonList.randomElement() ?? ""
    }
    
}

#Preview {
    ContentView()
}
