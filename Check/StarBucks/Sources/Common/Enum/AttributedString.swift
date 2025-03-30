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
    case nickname(nickname: String, suffix: String, color: Color)
    case rewardCount(count: Int)
    
    var attributedString: SwiftUI.AttributedString {
        switch self {
        case .nickname(let nickname, let suffix, let color):
            var attributedString = SwiftUI.AttributedString(nickname)
            
            if let range = attributedString.range(of: nickname) {
                attributedString[range].foregroundColor = color
            }
            
            attributedString.append(SwiftUI.AttributedString(suffix))
            if let range = attributedString.range(of: suffix) {
                attributedString[range].foregroundColor = .black
            }
            
            return attributedString
            
        case .rewardCount(let count):
            
            let countString = "\(count)"
            var attributedString = SwiftUI.AttributedString(countString)
            
            if let range = attributedString.range(of: countString) {
                attributedString[range].foregroundColor = Color.black03
                attributedString[range].font = .mainTextSemiBold38
                
            }
            
            let dash = " /"
            attributedString.append(SwiftUI.AttributedString(dash))
            
            if let range = attributedString.range(of: dash) {
                attributedString[range].foregroundColor = Color.gray01
                attributedString[range].font = .mainTextBold24
            }
            
            let maxCount = " 12"
            attributedString.append(SwiftUI.AttributedString(maxCount))
            
            if let range = attributedString.range(of: maxCount) {
                attributedString[range].foregroundColor = Color.brown02
                attributedString[range].font = .mainTextBold24
            }
            
            return attributedString

        }
    }
}
