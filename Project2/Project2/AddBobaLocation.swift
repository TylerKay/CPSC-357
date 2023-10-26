////
////  AddBobaLocation.swift
////  Project2
////
////  Created by Tyler Kay on 10/23/23.
////
//
import Foundation
import SwiftUI



struct AddBobaLocation: View {
    // saves the states of the user input as they type.
    @StateObject var bobaStore : BobaStore
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var tier: String = ""
    @State private var imageName: String = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Boba Location Details")) {
                Image("boba_icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Boba Location Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                DataInput(title: "Tier", userInput: $tier)
            }
            Button(action: addNewBobaLocation) {
                Text("Add Boba Location")
            }
        }
    }
    
    // this function adds the creates a new BobaLocation object
    func addNewBobaLocation() {
        let newBobaLocation = BobaLocation(id: UUID().uuidString,
                                           name: name, description: description, tier: tier, imageName: imageName)
        bobaStore.BobaLocations.append(newBobaLocation)
    }
    
}

// DataInput renders a textfield box for the user input to enter information into
struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}


struct AddBobaLocation_Previews: PreviewProvider {
    static var previews: some View {
        AddBobaLocation(bobaStore: BobaStore(BobaLocations: bobaData))
    }
}
