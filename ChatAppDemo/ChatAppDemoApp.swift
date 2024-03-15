//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by jaewon Lee on 3/15/24.
//

import SwiftUI
import Firebase

@main
struct ChatAppDemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
