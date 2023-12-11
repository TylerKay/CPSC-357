//
//  FirstTabView.swift
//  LifecycleDemo
//
//  Created by Tyler Kay on 10/31/23.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("View One")
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
    }

}

#Preview {
    FirstTabView()
}
