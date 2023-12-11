//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by Tyler Kay on 11/9/23.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") var editorText: String = "Sample Text"
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
