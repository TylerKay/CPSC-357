//
//  ContentView.swift
//  DrawDemo
//
//  Created by Tyler Kay on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    let colors = Gradient(colors: [Color.red,
                                   Color.yellow, Color.green,
                                   Color.blue, Color.purple])
    var body: some View {
        Circle()
            .fill(AngularGradient (gradient: colors,
                                  center: .center))
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}
