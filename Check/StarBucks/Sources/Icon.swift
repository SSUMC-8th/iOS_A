//
//  Icon.swift
//  StarBucks
//
//  Created by LEE on 3/17/25.
//

import SwiftUI

enum Icon: String {
    
    // MARK: - Splash
    case starbucks = "starbucks"
    
    // MARK: - Login
    case apple_login = "apple_login"
    case kakao_login = "kakao_login"
    
    var image: Image {
        return Image(self.rawValue)
    }
    
}
