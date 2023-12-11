//
//  ContentView.swift
//  DataFlow_Lab
//
//  Created by Tyler Kay on 10/11/23.
//

import SwiftUI
//
class CustomData: ObservableObject {
    @Published var value: Float = 0.0
    var id = UUID()
}
struct ContentSubview: View {
    @Binding var sliderPosition: Float
    @EnvironmentObject var customData: CustomData
    var body: some View {
        VStack {
            Slider(value: $sliderPosition, in: -10...10) {_ in
                customData.value = sliderPosition
            }
            Text("\(sliderPosition)")
            Text("\(customData.value)")
            Text("\(customData.id)")
        }
        .background(Color.black.brightness(0.95))
    }
}
struct ContentSubviewSecond: View {
    @State var sliderPosition: Float = 0.0
    @EnvironmentObject var customData: CustomData
    var body: some View {
        VStack {
            Slider(value: $sliderPosition, in: -10...10) {_ in
                customData.value = sliderPosition
            }
            Text("\(sliderPosition)")
            Text("\(customData.value)")
            Text("\(customData.id)")
        }
        .background(Color.red.brightness(0.4))
    }
}
struct ContentView: View {
    @State var value: Float = 0
    let data = CustomData()
    var body: some View {
        VStack(alignment: .center) {
            ContentSubview(
                sliderPosition: $value)
            Text("\(value)")
            ContentSubviewSecond()
        }
        .padding()
        .environmentObject(data)
    }
}


#Preview {
    ContentView()
}




//
//private struct SensitiveDataVisible: EnvironmentKey {
//    static let defaultValue: Bool = false
//}
//
//extension EnvironmentValues {
//    var sensitiveVisible: Bool {
//        get { self[SensitiveDataVisible.self] }
//        set { self[SensitiveDataVisible.self] = newValue }
//    }
//}
//
//extension View {
//    func sensitiveVisible(_ value: Bool) -> some View {
//        environment(\.sensitiveVisible, value)
//    }
//}
//
//
//struct ViewOne: View {
//    @Environment(\.sensitiveVisible) private var showSensitive
//    var body: some View {
//        VStack(alignment: .center) {
//            if showSensitive {
//                Text("Secret 123")
//            } else {
//                Text("**********")
//            }
//        }
//        .padding()
//    }
//}
//struct ViewTwo: View {
//    @Environment(\.sensitiveVisible) private var showSensitive
//    var body: some View {
//        VStack(alignment: .center) {
//            if showSensitive {
//                Text("Secret ABC")
//            } else {
//                Text("**********")
//            }
//        }
//        .padding()
//    }
//}
//struct ContentView: View {
//    @State private var showSensitive = false
//    var body: some View {
//        VStack(alignment: .center) {
//            Toggle("Show sensitive data", isOn: $showSensitive)
//            ViewOne()
//                .sensitiveVisible(showSensitive)
//            ViewTwo()
//                .sensitiveVisible(showSensitive)
//        }
//        .padding()
//    }
//}
//

//
//#Preview {
//    ContentView()
//}
