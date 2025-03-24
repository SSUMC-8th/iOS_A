//
//  LoginViewModel.swift
//  Week1
//
//  Created by LEE on 3/17/25.
//

import Foundation
import SwiftUI

@Observable
class LoginViewModel {
    
    // MARK: Properties
    /// 입력한 아이디
    var enteredId: String = ""
    
    /// 입력한 비밀번호
    var enteredPassword: String = ""
    
    /// 텍스트필드에 입력한 문자열이 있는지?
    var canLogin: Bool {
        
        return !enteredId.isEmpty && !enteredPassword.isEmpty
    }
}
