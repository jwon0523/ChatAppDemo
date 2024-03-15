//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by jaewon Lee on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager() 
    
    var body: some View {
        VStack {
            TitleRow()
            
            ScrollView {
                ForEach(messagesManager.messages, id: \.id) { message in
                    MessageBubble(message: message)
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
