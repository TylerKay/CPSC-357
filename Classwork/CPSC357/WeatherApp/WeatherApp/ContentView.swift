//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tyler Kay on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        NavigationView{
            VStack {
                Text (viewModel.timeZone).font(.title)
                Text (viewModel.temperature).font(.largeTitle)
                Text (viewModel.title).font(.title3)
                Text (viewModel.description).font(.title3)
            }.navigationTitle("Weather")
        }
    }
}

#Preview {
    ContentView()
}
