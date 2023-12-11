//
//  MarkerInfo.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/10/23.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

// sets the information of each marker/pin
struct MarkerInfo: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let tint: Color
    let reason: String
}
