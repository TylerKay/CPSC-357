//
//  Figure3.swift
//  Project3
//
//  Created by Tyler Kay on 11/14/23.
//

import SwiftUI

struct Figure3: View {
    @State private var isHidden = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isHidden.toggle()
                }
            }) {
                Text(isHidden ? "Tap to show capsule" : "Tap to hide capsule")
            }

            if !isHidden {
                Capsule()
                    .stroke(lineWidth: 10)
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 100)
                    .opacity(isHidden ? 0 : 1)
            }
        }
        .padding()
    }
}

#Preview {
    Figure3()
}
