//
//  ContentView.swift
//  SendRecevedPractice Watch App
//
//  Created by 広瀬友哉 on 2023/12/26.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = WatchViewModel()
    
    @State var textReceved: String = ""
    
    @State var buttonCounter: Int = 0
    
    var body: some View {
        VStack {
            
            Text(viewModel.message + ":" + String(viewModel.counter))
            
            Button("Send") {
                
                viewModel.countUp()
                
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
