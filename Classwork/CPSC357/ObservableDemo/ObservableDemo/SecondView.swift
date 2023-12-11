//
//  SecondView.swift
//  ObservableDemo
//
//  Created by Tyler Kay on 10/10/23.
//

import SwiftUI

struct SecondView: View {
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        VStack {
            Text("Second View - Timer count: \(timerData.timeCount)")
            Button(action: timerData.resetCount, label: {
                Text("Reset")
            })
        }
        .padding()
    }
}

//#Preview {
//    SecondView()
//}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(timerData: TimerData())
    }
}
