//
//  MainMap.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/3/23.
//

import SwiftUI
import MapKit

struct MainMap: View {
    @StateObject var markerStore : MarkerStore
    @State var camera: MapCameraPosition = .automatic
    
    // Initialze the region fo the map
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.79359, longitude: -117.85158),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // Initializes the state information for the marker that the user clicks
    @State private var selectedMarker: MarkerInfo?
    @State var selectedMarkerCoords = CLLocationCoordinate2D()
    @State var selectedMarkerName: String = ""
    @State var selectedMarkerAccessOption: String = ""
    @State var selectedMarkerReason: String = ""
    @State var selectedMarkerTint: Color = .gray
    
    @State private var isMarkerDetailActive = false
    
    
    var body: some View {
        NavigationView {
            Map(position: $camera) {
                ForEach(markerStore.markerLocations) { markerInfo in
                    
                    // Creating an annotation marker for each in the markerStore
                    Annotation("", coordinate: markerInfo.coordinate) {
                        ZStack {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    selectedMarker = markerInfo

                                    // unwrapping the selectedMarker and parsing it
                                    if let unwrappedMarker = selectedMarker {
                                        // Now you can use unwrappedMarker
                                        selectedMarkerCoords = CLLocationCoordinate2D(latitude: unwrappedMarker.coordinate.latitude, longitude: unwrappedMarker.coordinate.longitude)
                                        selectedMarkerName = unwrappedMarker.name
                                        selectedMarkerReason = unwrappedMarker.reason
                                        selectedMarkerTint = unwrappedMarker.tint
                                    } else {
                                        selectedMarker = nil
                                        print("selectedMarker is nil")
                                    }
                                    
                                    isMarkerDetailActive = true
                                    markerStore.updateNavBarStatus(hideNavBar: true) // Update the hideNavBar status
                                    print("Current View Controller: \(String(describing: type(of: self)))")
                                }
                                .foregroundStyle(.white, markerInfo.tint)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .background(// Navigate to the DisplayPin View if a marker is clicked
                NavigationLink("", destination: DisplayPinInfoView(markerStore: self.markerStore, selectedMarkerCoords: selectedMarkerCoords, selectedMarkerName: selectedMarkerName, selectedMarkerReason: selectedMarkerReason, selectedMarkerTint: selectedMarkerTint), isActive: $isMarkerDetailActive)
                    .hidden()
            )
        }

    }
}

struct MarkerInfo: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let tint: Color
    let reason: String
}

//#Preview {
//    MainMap()
//}
