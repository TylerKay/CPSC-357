//
//  ContentView.swift
//  Project2
//
//  Created by Tyler Kay on 10/23/23.

import SwiftUI

struct ContentView: View {
    @StateObject private var bobaStore : BobaStore = BobaStore(BobaLocations: bobaData)
    
    var body: some View {
        // Render the navigation view of all the boba locations
        NavigationView {
            List {
                // show each boba location in a list
                ForEach (bobaStore.BobaLocations) { bobaLocation in
                    ListCell(bobaLocation: bobaLocation)
                }
                // adds the delete and move functionality (functions located at the very bottom)
                .onDelete(perform: deleteBobaLocation)
                .onMove(perform: moveBobaLocation)
            }
            .navigationBarTitle(Text("Boba Locations"))
            .navigationBarItems(leading: NavigationLink(destination:
            AddBobaLocation(bobaStore: self.bobaStore)) {
            Text("Add") // adds the add functionality that links to the AddBobaLocation view
            .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    
    struct ListCell: View {
        var bobaLocation: BobaLocation
        var body: some View {
            // links to the BobaLocationDetails view.
            NavigationLink(destination: BobaLocationDetails(selectedLocation: bobaLocation)) {
                HStack {
                    Image(bobaLocation.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 60)
                    Text(bobaLocation.name)
                }
            }
        }
    }
    
    // Removes the current index of the bobaLocation object from the bobaStore
    func deleteBobaLocation(at offsets: IndexSet) {
        bobaStore.BobaLocations.remove(atOffsets: offsets)
    }
    
    // Rearranges the index of the selected bobaLocation in the bobaStore
    func moveBobaLocation(from source: IndexSet, to destination: Int) {
        bobaStore.BobaLocations.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}
