//
//  DisplayPinInfo.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/6/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct DisplayPinInfoView: View {
    //    @EnvironmentObject var draggablePinData: DraggablePinData
    @State private var name: String = "name"
    //    @State private var location: String = ""
    @State private var accessibilityOption: String = ""
    @State private var reason: String = "reason"
    
    @StateObject var markerStore : MarkerStore
    @State var selectedMarkerCoords: CLLocationCoordinate2D
    @State var selectedMarkerName: String
    @State var selectedMarkerReason: String
    @State var selectedMarkerTint: Color
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // relocate back to main map
    
    
    //    init(){
    //        print("Current View Controller: \(String(describing: type(of: self)))")
    //    }
    
    
    var body: some View {
        VStack {
            Text("Location Name: \(selectedMarkerName)")
            Spacer()
            Text("Reason/comment: \(selectedMarkerReason)")
            Spacer()
            Text("Longitude: \(String(selectedMarkerCoords.latitude))")
            Text("Latitude: \(String(selectedMarkerCoords.longitude))")
            Spacer()
            
            Button("Delete") {
                if let indexToRemove = markerStore.markerLocations.firstIndex(where: { ($0.coordinate.latitude == selectedMarkerCoords.latitude) && ($0.coordinate.longitude == selectedMarkerCoords.longitude) }) {
                    markerStore.markerLocations.remove(at: indexToRemove)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        // You can also use onDisappear to detect when the view disappears
        .onDisappear {
            markerStore.updateNavBarStatus(hideNavBar: false)
        }
        
    }
}

//#Preview {
//    AddPinInfoView()
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create an instance of DraggablePinData
//        let draggablePinData = DraggablePinData()
//
//        // Inject the environment object into ConfirmLocationView
//        DisplayPinInfoView().environmentObject(draggablePinData)
//        
//    }
//}

