//
//  SignupViewModel.swift
//  StarBucks
//
//  Created by 한태빈 on 3/25/25.
//

import Foundation
import SwiftUI
import KeychainAccess  // 추가

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupModel(nickname: "태빈", email: "", password: "")

    private let keychain = Keychain(service: "com.yourapp.identifier")

    public func storageData() {
        keychain["nickname"] = signupModel.nickname
        keychain["userId"] = signupModel.email
        keychain["password"] = signupModel.password
    }
}
