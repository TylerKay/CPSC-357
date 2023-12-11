//
//  ContentView.swift
//  GestureDemo
//
//  Created by Tyler Kay on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnabled: Bool = false
    var body: some View {
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0)
            .onEnded( { _ in
                self.dragEnabled = true
            })
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transaction in
                switch value {
                case .first(true):
                    print("Long press in progress")
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                default: break
                }
            }
            .onEnded { value in
                self.dragEnabled = false
            }
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnabled ? Color.green : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressBeforeDrag)
    }}



#Preview {
    ContentView()
}
