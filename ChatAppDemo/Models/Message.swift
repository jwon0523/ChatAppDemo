//
//  Message.swift
//  ChatAppDemo
//
//  Created by jaewon Lee on 3/15/24.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
