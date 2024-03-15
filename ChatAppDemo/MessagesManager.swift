//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by jaewon Lee on 3/16/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
    // Firestore database의 인스턴스를 생성
    let db = Firestore.firestore()
    
    init() {
        getMessage()
    }
    
    // addSnapShotListener을 사용해 Firestore에 있는 메세지를 실시간으로 읽어옴
    func getMessage() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            
            // firestore에 document가 있는지 확인
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // documents를 통해 매핑
            self.messages = documents.compactMap({ document -> Message? in
                do {
                    // 각각의 document를 Message model로 변환
                    // data(as:)는 FirebaseFirestoreSwift에서만 사용할 수 있는 함수
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    // 에러 발생시 nil을 반환. 하지만 마지막 배열에 compatMap의 값은 포함되지 않음
                    return nil
                }
            })
            
            // 보낸 메세지 timestamp 기준으로 정렬
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            // ContentView에서 자동 스크롤을 구현하기 위해 마지막 메세지의 ID값을 가져옴.
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    // Firebase에 새로운 메세지 추가
    func sendMessage(text: String) {
        do {
            // 새로운 메세지 인스턴스를 생성. received는 항상 false(메세지를 보내는 것은 나뿐이기 때문)
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            
            // 새로운 document를 Message model에 맞춰 Firebase안에 생성.
            // setData는 newMessage를 ㄹirestore 데이터로 변환
            // setData(from:)은 FirebaseFirestoreSwift 안에서만 사용 가능.
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
}
