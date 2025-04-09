//
//  SignupViewModel.swift
//  StarBucks
//
//  Created by 한태빈 on 3/25/25.
//

import Foundation


import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupModel(nickname: "태빈", email: "", password: "")

    @AppStorage("nickname")  var savedNickname: String = "태빈"
    @AppStorage("email")  var savedEmail: String = ""
    @AppStorage("password")  var savedPassword: String = ""

    public func storageData() {
        savedNickname = signupModel.nickname
        savedEmail = signupModel.email
        savedPassword = signupModel.password
    }
}

