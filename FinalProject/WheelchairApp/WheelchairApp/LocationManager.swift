//
//  LocationManager.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/3/23.
//

import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    // Properties
    @Published var mapView: MKMapView = .init()
    @Published var manager: CLLocationManager = .init()
    
    // Search Bar Text
    @Published var searchText: String = ""
    
    override init() {
        super.init()
        // Setting Delegates
        manager.delegate = self
        mapView.delegate = self
        
        // Mark: Requestion Location access
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle error
        print(error)
    }
    
    // Mark: Location Auth
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: manager.requestLocation()
        case .authorizedWhenInUse: manager.requestLocation()
        case .denied: handleLocationError()
        case .notDetermined: manager.requestWhenInUseAuthorization()
        default: ()
            
        }
    }
    
    func handleLocationError(){
        print("Location Error")
    }
}
