////
////  MapTest.swift
////  WheelchairApp
////
////  Created by Tyler Kay on 12/9/23.
//////
////
////import Foundation
////import SwiftUI
////import MapKit
////
////struct MainMap2: View {
//////    @StateObject var markerStore : MarkerStore
////    
////    let markers = [
////        MarkerInfo2(name: "CN Tower", coordinate: CLLocationCoordinate2D(latitude: 43.64272145122822, longitude: -79.38712117539345), tint: .blue),
////        MarkerInfo2(name: "Art Gallery", coordinate: CLLocationCoordinate2D(latitude: 43.653823848647725, longitude: -79.3925230435043), tint: .red),
////        MarkerInfo2(name: "Museum", coordinate: CLLocationCoordinate2D(latitude: 43.66785712547134, longitude: -79.39465908518817), tint: .orange)
////    ]
////
////    @State var camera: MapCameraPosition = .automatic
////    
////    var body: some View {
////        Map(position: $camera){
//////            ForEach(markers) { markerInfo in
//////                Marker(markerInfo.name, coordinate: markerInfo.coordinate).tint(markerInfo.tint)
//////            }
////            ForEach (markers) { markerInfo in
////                Annotation("", coordinate: markerInfo.coordinate)
////                Marker(markerInfo.name, coordinate: markerInfo.coordinate).tint(markerInfo.tint)
////            }
////        }
////        .safeAreaInset(edge: .bottom) {
////            HStack {
////                Spacer()
////                ForEach(markers) { markerInfo in
////                    Button {
////                        // Center on the selected marker
////                        camera = .region(
////                            MKCoordinateRegion(center: markerInfo.coordinate, latitudinalMeters: 400, longitudinalMeters: 400)
////                        )
////                    } label: {
////                        Text(markerInfo.name)
////                    }
////                    Spacer()
////                }
////            }
////            .padding(.top)
////            .background(.thinMaterial)
////        }
////    }
////}
////
////struct MarkerInfo2: Identifiable {
////    let id = UUID()
////    let name: String
////    let coordinate: CLLocationCoordinate2D
////    let tint: Color
////}
////
////#Preview {
////    MainMap2()
////}
//
//
//import SwiftUI
//import MapKit
//import CoreLocation
//
//struct MainMap2: View {
//    @State private var region: MKCoordinateRegion
//    @State private var selectedMarker: MarkerInfo2?
//
//    @State var camera: MapCameraPosition = .automatic
//    @State private var isMarkerDetailActive = false
////    @StateObject var markerStore : MarkerStore
//
//    let markers = [
//        MarkerInfo2(name: "CN Tower", coordinate: CLLocationCoordinate2D(latitude: 43.64272145122822, longitude: -79.38712117539345), tint: .blue),
//        MarkerInfo2(name: "Art Gallery", coordinate: CLLocationCoordinate2D(latitude: 43.653823848647725, longitude: -79.3925230435043), tint: .red),
//        MarkerInfo2(name: "Museum", coordinate: CLLocationCoordinate2D(latitude: 43.66785712547134, longitude: -79.39465908518817), tint: .orange)
//    ]
//
//    init(region: MKCoordinateRegion) {
//        _region = State(initialValue: region)
//    }
//
//    var body: some View {
//        NavigationView {
//            Map(position: $camera) {
//                ForEach(markers) { marker in
//                    Annotation("", coordinate: marker.coordinate) {
//                        ZStack {
//                            Image(systemName: "mappin.circle.fill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 30)
//                                .onTapGesture {
//                                    selectedMarker = marker
//                                    isMarkerDetailActive = true
//                                    print("\(selectedMarker?.coordinate.longitude)")
//                                }
//                                .foregroundStyle(.white, .purple)
//                        }
//                    }
//                }
//            }
//            .edgesIgnoringSafeArea(.all)
//            .background(
//                NavigationLink("", destination: DisplayPinInfoView(hideNavBar: <#T##Bool#>), isActive: $isMarkerDetailActive)
//                    .hidden()
//            )
//        }
//    }
//}
//
//
//struct MarkerInfo2: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//    let tint: Color
//}
//
//struct MainMap2_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMap2(region: MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
//            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//        ))
//    }
//}
