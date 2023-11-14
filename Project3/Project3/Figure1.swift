//
//  Figure1.swift
//  Project3
//
//  Created by Tyler Kay on 11/13/23.
//

import SwiftUI

struct Figure1: View {
    @State private var scale: CGFloat = 1
    @State private var rotation: Double = 0
    
    let colors = Gradient(colors: [Color.red,
                                   Color.yellow, Color.green,
                                   Color.blue, Color.purple])
    
    var body: some View {
        VStack {
            Circle()
                .fill(RadialGradient (gradient: colors,
                                      center: .center,
                                      startRadius: CGFloat(0),
                                      endRadius: CGFloat(300)))
                .gesture(
                    TapGesture()
                        .onEnded {_ in
                            withAnimation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0)) {
                                self.scale = (self.scale < 1.5 ? self.scale + 0.3: 1)
                            }
                        }
                )
                .scaleEffect(scale)
            
            
            Text("Tap to bounce the circle")
        }
    }
}

#Preview {
    Figure1()
}

