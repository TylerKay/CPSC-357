//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by Tyler Kay on 11/9/23.
//

import SwiftUI


struct SceneStorageView: View {
    @State private var editorText: String = ""
    var body: some View {
        TextEditor(text: $editorText)
        //The TextEditor view is passed a binding to a state property into
        //which any typed text will be stored
        // (note that we aren’t yet using scene storage).
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
