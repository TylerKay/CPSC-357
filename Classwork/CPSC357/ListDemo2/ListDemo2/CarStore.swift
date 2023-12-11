//
//  CarStore.swift
//  ListDemo2
//
//  Created by Tyler Kay on 10/12/23.
//

import SwiftUI
import Combine
class CarStore : ObservableObject {
    @Published var cars: [Car]
    init (cars: [Car] = []) {
        self.cars = cars
    }
}
