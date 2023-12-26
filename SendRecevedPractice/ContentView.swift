//
//  ContentView.swift
//  SendRecevedPractice
//
//  Created by 広瀬友哉 on 2023/12/26.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = PhoneViewModel()
    
    @State var textEdit: String = ""
    
    var body: some View {
        VStack {
            Text(String(viewModel.counter))
            HStack{
                TextField("messages", text: $textEdit).textFieldStyle(.roundedBorder)
                Button("Send") {
                    viewModel.countUp(textEdit)
                }.buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
