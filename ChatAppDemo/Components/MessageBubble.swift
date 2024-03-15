//
//  MessageBubble.swift
//  ChatAppDemo
//
//  Created by jaewon Lee on 3/15/24.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(
                        message.received ? Color("Gray") : Color("Peach")
                    )
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: message.received ? .leading : .trailing
        )
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(
        message: Message(
            id: "1",
            text: "채팅 앱 만들어보기!",
            received: false,
            timestamp: Date()
        ))
}
