//
//  SearchView.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/3/23.
//
//

import SwiftUI
import CoreLocation

struct ConfirmLocationView: View {
    let data = DraggablePinData()
    @State var value: Float = 0
    //    @State private var pinCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    @EnvironmentObject var draggablePinData: DraggablePinData
    @Binding var rootIsActive : Bool
    @StateObject var markerStore : MarkerStore
    
    
    var body: some View {
        VStack {
            Text("Press and hold to move the pin location").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            ZStack {
                
                // Map view
                MoveablePinMap()
                    .padding()
            }
            VStack(spacing: 15){
                Text("Confirm Location")
                    .font(.title2.bold())
                
                HStack(spacing: 15){}
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.vertical, 10)
                Text("Pin Coordinates: \(draggablePinData.coordinates.latitude), \(draggablePinData.coordinates.longitude)")
                
            }
            NavigationLink(destination: AddPinInfoView(shouldPopToRootView: self.$rootIsActive, markerStore: self.markerStore)) {
                Text("Confirm Location")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.blue)
                    }
                    .overlay(alignment: .trailing) {
                        Image(systemName: "arrow.right")
                            .font(.title3.bold())
                            .padding(.trailing)
                    }
                    .foregroundColor(.white)
            }
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create an instance of DraggablePinData
//        let draggablePinData = DraggablePinData()
//
//        // Inject the environment object into ConfirmLocationView
//        ConfirmLocationView().environmentObject(draggablePinData)
//    }
//}
