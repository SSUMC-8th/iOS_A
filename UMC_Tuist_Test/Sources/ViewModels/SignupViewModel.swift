//
//  SignupViewModel.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/22/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupModel(nickname: "", email: "", password: "")
    
    @AppStorage("nickname") private var storedNickname: String = ""
    @AppStorage("email") private var storedEmail: String = ""
    @AppStorage("password") private var storedPassword: String = ""
    
    public func SaveUserData() {
        storedNickname = signupModel.nickname
        storedEmail = signupModel.email
        storedPassword = signupModel.password
    }
}
