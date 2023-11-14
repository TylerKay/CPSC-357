//
//  Figure2.swift
//  Project3
//
//  Created by Tyler Kay on 11/14/23.
//

import SwiftUI

struct Figure2: View {
    @State private var rotation: Double = 0.0
    @State private var scale: CGFloat = 1.0

    var body: some View {
        
        VStack {
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 20,
                                           dash: [CGFloat(10), CGFloat(5), CGFloat(2)],
                                           dashPhase: CGFloat(10)))
                .foregroundColor(.blue)
                .frame(width: 250, height: 150)
                .scaleEffect(scale)
                .rotationEffect(Angle(degrees: rotation))
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                        self.scale = 0.5
                    }
                }
                .onLongPressGesture {
                    withAnimation {
                        rotation += 90.0
                    }
                }
                .padding(100)
            
            Text("Long Press on Ellipse to Rotate Animation")
            
        }
            
    }
}




#Preview {
    Figure2()
}
