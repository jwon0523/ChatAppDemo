//
//  Extensions.swift
//  ChatAppDemo
//
//  Created by jaewon Lee on 3/16/24.
//

import Foundation
import SwiftUI

// 특정 모서리에 둥근 모서리를 추가하기 위한 확장
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// 모서리 반지름 확장에 사용되는 사용자 정의 RoundedCorner
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
