//
//  DraggablePinMap.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/5/23.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct MoveablePinMap: UIViewRepresentable {
    @EnvironmentObject var draggablePinData: DraggablePinData
    
    // makeUIView method configures to the MKMapView instance. Sets the location, adds a draggable pin, and sets the initial region
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let initialLocation = CLLocationCoordinate2D(latitude: 33.79359, longitude: -117.85158)
        let annotation = DraggablePin(coordinate: initialLocation, title: "Drag me!")
        
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        mapView.delegate = context.coordinator
        
        
        return mapView
    }
    
    // Updates view when there is a change.
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    // Creates instance of Coordinator class. Handles MapView delegate functions
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Coordinator class acts as the delegate for the MKMapView. Handles events for draggable pin.
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MoveablePinMap // Reference to ConfirmLocationView
        
        init(_ parent: MoveablePinMap) {
            self.parent = parent
        }
        
        // The method mapView uses the MKMapViewDelegate protocol. Specifically, mapView is responsible for providing the annotation view for the DraggablePin class.
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? DraggablePin else { return nil }
            
            let identifier = "draggablePin"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            // checks if the annotation is the type DraggablePin
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.isDraggable = true
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        // Makes any updates and changes when draggablePin is moved. Updates the states
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
            if newState == .ending || newState == .canceling {
                if let annotation = view.annotation as? DraggablePin {
                    print("New location: \(annotation.coordinate)")
                    parent.draggablePinData.updateCoordinates(newCoordinates: annotation.coordinate)
                }
            }
        }
    }
}



//https://stackoverflow.com/questions/45871084/trouble-creating-custom-mkannotationview
class DraggablePin: NSObject, MKAnnotation { // initialize DraggablePin objects. Has title, coordinates
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
        super.init()
    }
}
