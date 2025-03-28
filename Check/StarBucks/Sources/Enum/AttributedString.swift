//
//  AttributedString.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import Foundation
import SwiftUI

enum AttributedString {
    
    /// 닉네임에 초록색을 입히고 " 님"을 검은색으로 추가
    case nickname(nickname: String)
    
    var attributedString: SwiftUI.AttributedString {
        switch self {
        case .nickname(let nickname):
            var attributedString = SwiftUI.AttributedString(nickname)
            
            if let range = attributedString.range(of: nickname) {
                attributedString[range].foregroundColor = Color.green01
            }
            
            let suffix = " 님"
            attributedString.append(SwiftUI.AttributedString(suffix))
            if let range = attributedString.range(of: suffix) {
                attributedString[range].foregroundColor = .black
            }
            
            return attributedString
        }
    }
}
