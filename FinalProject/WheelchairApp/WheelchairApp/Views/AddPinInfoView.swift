//
//  AddPinInfoView.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/5/23.
//

import SwiftUI
import CoreLocation

struct AddPinInfoView: View {
    @EnvironmentObject var draggablePinData: DraggablePinData
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    //    @State private var location: String = ""
//    @State private var accessibilityOption: String = ""
    @State private var tint: Color = .gray
    @State private var reason: String = ""
    
    @Binding var shouldPopToRootView : Bool
    @StateObject var markerStore : MarkerStore
    
    var colors = ["Excellent", "Decent", "Terrible"]
    @State private var selectedColor = "Excellent"
    
    @State private var triggerIncompleteMessage: Bool = false
    
    
    var body: some View {
        VStack {
            TextField(
                "Location Name",
                text: $name
            )
            Spacer()
            
            Text("How accessible is this location?")
            Picker("How accessible is this location?", selection: $selectedColor) { // Picker for how accessible. Excellent, Decent, or Terrible ranking
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            Spacer()
            
            TextField(
                "Reason",
                text: $reason
            )
            Spacer()
            
            Text("Latitude: \(draggablePinData.coordinates.latitude)")
                .padding()
            Text("Longitude: \(draggablePinData.coordinates.longitude)")
                .padding()
            
            // Display user friendly error message if incomplete
            triggerIncompleteMessage ? Text("Please fill out the name and reason before proceeding").foregroundColor(.red).padding() : nil
            
            
            Button(action: {
                
                // Grab the selectedColor of the associated string
                if (selectedColor == "Terrible"){
                    tint = .red
                } else if (selectedColor == "Decent"){
                    tint = .yellow
                } else {
                    tint = .green
                }
                
                // Check if everything is filled out
                if ((name == "") || (reason == "")){
                    print("Please fill out the name and reason before proceeding")
                    triggerIncompleteMessage = true
                } else {
                    // Add the new marker if everything is filled out
                    markerStore.addMarker(name: self.name, coordinate: CLLocationCoordinate2D(latitude: draggablePinData.coordinates.latitude, longitude: draggablePinData.coordinates.longitude), tint: tint, reason: self.reason)
                    shouldPopToRootView = false // return to ContentView (MainMap)
                }
                
            }) {
                Text("Add Pin")
            }
            
            
            
            
        }.padding()
    }
}

//#Preview {
//    AddPinInfoView()
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create an instance of DraggablePinData
//        let draggablePinData = DraggablePinData()
//
//        // Inject the environment object into ConfirmLocationView
//        AddPinInfoView().environmentObject(draggablePinData)
//        
//    }
//}

