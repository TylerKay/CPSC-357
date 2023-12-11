//
//  SecondTabView.swift
//  LifecycleDemo
//
//  Created by Tyler Kay on 10/31/23.
//

import SwiftUI

struct SecondTabView: View {
    @State private var text: String = ""
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text, perform: { value in
                print("onChange triggered")
            })
    }
}

#Preview {
    SecondTabView()
}
