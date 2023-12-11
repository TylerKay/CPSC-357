//
//  ContentView.swift
//  ObservableDemo
//
//  Created by Tyler Kay on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer count: \(timerData.timeCount)")
                Button(action: timerData.resetCount, label: {
                    Text("Reset")
                })
                
                NavigationLink(destination: SecondView()) {
                    Text("Next Screen")
                }
            }
        }.environmentObject(timerData)
        .padding()
    }
}

#Preview {
    ContentView()
}
