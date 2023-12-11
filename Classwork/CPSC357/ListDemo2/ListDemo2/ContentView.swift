//
//  ContentView.swift
//  ListDemo2
//
//  Created by Tyler Kay on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var carStore : CarStore = CarStore(cars:
    carData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach (carStore.cars) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(destination:
            AddNewCar(carStore: self.carStore)) {
            Text("Add")
            .foregroundColor(.blue)
            }, trailing: EditButton())
        }

    }
    
    struct ListCell: View {
        var car: Car 
        var body: some View {
            NavigationLink(destination: CarDetail(selectedCar: car)) {
                HStack {
                    Image(car.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 60)
                    Text(car.name)
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }

}

#Preview {
    ContentView()
}
