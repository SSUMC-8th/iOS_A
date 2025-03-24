//
//  SignUpModel.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import Foundation
import SwiftUI

struct SignUpModel {
    
    // MARK: - @AppStorage
    /// 아이디
    @AppStorage("userId") var userId: String = ""
    
    /// 비밀번호
    @AppStorage("userPassword") var userPassword: String = ""
    
    /// 닉네임
    @AppStorage("userNickname") var userNickname: String = ""
    
}
