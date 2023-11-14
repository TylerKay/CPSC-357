//
//  ContentView.swift
//  Project3
//
//  Created by Tyler Kay on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Figure1()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Figure 1")
                }
            Figure2()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Figure 2")
                }
            Figure3()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("Figure 3")
                }
        }
    }
}

#Preview {
    ContentView()
}
