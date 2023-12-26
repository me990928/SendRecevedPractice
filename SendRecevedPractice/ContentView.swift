//
//  ContentView.swift
//  SendRecevedPractice
//
//  Created by 広瀬友哉 on 2023/12/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var textEdit: String = ""
    
    var body: some View {
        VStack {
            HStack{
                TextField("messages", text: $textEdit).textFieldStyle(.roundedBorder)
                Button("Send") {
                    
                }.buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
