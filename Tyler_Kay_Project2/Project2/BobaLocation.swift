//
//  BobaLocation.swift
//  Project2
//
//  Created by Tyler Kay on 10/23/23.
//

import Foundation
import SwiftUI

// Structure for the BobaLocation Object. 
struct BobaLocation: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var tier: String
    var imageName: String
}
