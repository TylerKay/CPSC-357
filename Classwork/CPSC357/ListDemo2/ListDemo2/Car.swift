//
//  Car.swift
//  ListDemo2
//
//  Created by Tyler Kay on 10/12/23.
//

import Foundation
import SwiftUI


struct Car : Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}
