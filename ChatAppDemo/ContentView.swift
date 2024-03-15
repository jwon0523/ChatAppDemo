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
            
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(messagesManager.messages, id: \.id) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .onChange(of: messagesManager.lastMessageId, initial: true) {
                    withAnimation {
                        proxy.scrollTo(messagesManager.lastMessageId, anchor: .bottom)
                    }
                }
            }
        }
        .background(Color("Peach"))
        
        MessageField()
            .environmentObject(messagesManager)
    }
}

#Preview {
    ContentView()
}
