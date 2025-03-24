//
//  SignUpViewModel.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import Foundation
import SwiftUI

@Observable
class SignUpViewModel {
    
    // MARK: - Properties
    /// 입력받은 닉네임
    var enteredNickname: String = ""
    
    /// 입력받은 아이디
    var enteredId: String = ""
    
    /// 입력받은 비밀번호
    var enteredPassword: String = ""
    
    /// 생성할 수 있는가
    var canCreateAccount: Bool {
        return !enteredId.isEmpty && !enteredNickname.isEmpty && !enteredPassword.isEmpty
    }
    
    // TODO: - 계정 생성 API 요청
    /// 계정 생성하기
    func createAccount() {
        
    }
}
