//
//  BobaStore.swift
//  Project2
//
//  Created by Tyler Kay on 10/23/23.
//

import Foundation
import Combine
import SwiftUI

class BobaStore : ObservableObject {
    @Published var BobaLocations: [BobaLocation]
    init (BobaLocations: [BobaLocation] = []) {
        self.BobaLocations = BobaLocations
    }
}

