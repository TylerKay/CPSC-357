//
//  ContentView.swift
//  AnimationDemo
//
//  Created by Tyler Kay on 11/2/23.
//

import SwiftUI

struct ContentView : View {
    @State private var isButtonVisible: Bool = true
    var body: some View {
        VStack {
            Toggle(isOn:$isButtonVisible.animation(
                .linear(duration: 2))) {
                    Text("Show/Hide Button")
                }.padding()
            if isButtonVisible {
                Button(action: {}) {
                    Text("Example Button")
                } .font(.largeTitle)
                    .transition(.asymmetric(insertion: .scale, removal:
                            .slide))

            } // end if
        } // end vstack
    } // end var body
}

extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        AnyTransition.opacity.combined(with: .move(edge:
                .top))
    }
}

#Preview {
    ContentView()
}
