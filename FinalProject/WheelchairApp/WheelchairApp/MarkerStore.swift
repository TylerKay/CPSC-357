//
//  PinStore.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/7/23.
//

import Foundation
import Combine
import SwiftUI
import CoreLocation

class MarkerStore: ObservableObject {
    @Published var markerLocations: [MarkerInfo]
    @Published var hideNavBar: Bool = false

    init(markerLocations: [MarkerInfo] = []) {
        self.markerLocations = markerLocations
    }
    
    func addMarker(name: String, coordinate: CLLocationCoordinate2D, tint: Color, reason: String) {
        let newMarker = MarkerInfo(name: name, coordinate: coordinate, tint: tint, reason: reason)
        markerLocations.append(newMarker)
    }
    
    func updateNavBarStatus(hideNavBar: Bool){
        self.hideNavBar = hideNavBar
    }
    
    
}
