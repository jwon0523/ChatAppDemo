//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by jaewon Lee on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    var messageArray = ["Hello!!", "How are you doing?", "Good!!!!"]
    
    var body: some View {
        VStack {
            TitleRow()
            
            ScrollView {
                ForEach(messageArray, id: \.self) { text in
                    MessageBubble(
                        message: Message(
                            id: "1",
                            text: text,
                            received: true,
                            timestamp: Date()
                        ))
                }
            }
            .padding(.top, 10)
            .background(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
        }
        .background(Color("Peach"))
        
        MessageField()
    }
}

#Preview {
    ContentView()
}
