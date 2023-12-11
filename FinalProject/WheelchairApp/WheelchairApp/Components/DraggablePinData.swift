//
//  DraggablePinData.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/6/23.
//

import Foundation
import CoreLocation

class DraggablePinData: ObservableObject {
    // Initialalize DraggablePinData class. This is what will be displayed on the ConfirmLocation View
    @Published var coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 33.79359, longitude: -117.85158)
    @Published var value: Float = 0.0
    var id = UUID()
    
    init(){
        
    }
    
    func updateCoordinates(newCoordinates: CLLocationCoordinate2D) {
        coordinates = newCoordinates
    }
}
