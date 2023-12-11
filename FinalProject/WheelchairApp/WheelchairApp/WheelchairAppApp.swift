//
//  WheelchairAppApp.swift
//  WheelchairApp
//
//  Created by Tyler Kay on 12/2/23.
//

import SwiftUI

@main
struct WheelchairAppApp: App {
    let draggablePinData = DraggablePinData()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(draggablePinData)
        }
    }
}
