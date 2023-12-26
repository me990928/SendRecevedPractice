//
//  ContentView.swift
//  SendRecevedPractice Watch App
//
//  Created by 広瀬友哉 on 2023/12/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var textReceved: String = ""
    
    @State var buttonCounter: Int = 0
    
    var body: some View {
        VStack {
            
            Text(textReceved + ":" + String(buttonCounter))
            
            Button("Send") {
                
                buttonCounter += 1
                
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
