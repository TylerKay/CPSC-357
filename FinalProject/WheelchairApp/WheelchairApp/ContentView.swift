//
//  ContentView.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/2/23.
//

// Sources: https://stackoverflow.com/questions/57334455/how-can-i-pop-to-the-root-view-using-swiftui#:~:text=The%20isActive%20parameter%20of%20a,just%20set%20isActive%20to%20false. -> Used to figure out how to return to root view after passing several navigationLinks.
// https://www.youtube.com/watch?v=fjZd1CwjlxQ -> Used to figure out how to get draggable pin on map to work on the ConfirmLocationView. 

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var draggablePinData: DraggablePinData
    @State var isActive : Bool = false
    @StateObject private var markerStore = MarkerStore()
    
    var body: some View {
        NavigationView {
            ZStack {
                MainMap(markerStore: self.markerStore)
                    .navigationBarTitle(Text("Mobility Map"))
                    .navigationBarItems(leading: NavigationLink(
                        destination: ConfirmLocationView(rootIsActive: self.$isActive, markerStore: self.markerStore),
                        isActive: self.$isActive
                    ) {
                        Text("Add") // adds the add functionality that links to the ConfirmLocationView
                            .foregroundColor(.blue)
                    }).navigationBarHidden(self.markerStore.hideNavBar)
                
            }.frame(minHeight: 350, maxHeight: 600).padding()
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of DraggablePinData
        let draggablePinData = DraggablePinData()

        // Inject the environment object into ConfirmLocationView
        ContentView().environmentObject(draggablePinData)

    }
}
