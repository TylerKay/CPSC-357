//
//  BobaLocationDetails.swift
//  Project2
//
//  Created by Tyler Kay on 10/23/23.
//

import Foundation
import SwiftUI


struct BobaLocationDetails: View {
    @State private var isBobaIconVisible: Bool = false
    
    let selectedLocation: BobaLocation
    var body: some View {
        
        // Displays all the information of the selectedLocation object
        Form {
            Section(header: Text("Boba Location Details")) {
                Image(selectedLocation.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text("Location: " + selectedLocation.name)
                    .font(.headline)
                Text("Description: " + selectedLocation.description)
                Text("Tier: " + selectedLocation.tier)
                    .font(.body)
                if isBobaIconVisible { // If the isBobaIconVisible state is true, render the emoji
                    Text("🧋")
                }
                
                Button(action: {
                    isBobaIconVisible.toggle()
                }) {
                    Text("Toggle Boba Emoji")
                }
            }
        }
        
    }
}


struct BobaLocationDetails_Previews: PreviewProvider {
    static var previews: some View {
        BobaLocationDetails(selectedLocation: bobaData[0])
    }
}
