//
//  LoginViewModel.swift
//  StarBucks
//
//  Created by 한태빈 on 3/25/25.
//

import Foundation
import KeychainAccess

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pwd: String = ""

    private let keychain = Keychain(service: "com.yourapp.identifier")

    init() {
        if let savedId = keychain["userId"], let savedPwd = keychain["password"] {
            id = savedId
            pwd = savedPwd
            // 자동 로그인 처리 플래그 설정 (예: UserDefaults에 isLoggedIn 저장)
        }
    }

    func login(router: NavigationRouter) {
        // 로그인 성공 시
        keychain["userId"] = id
        keychain["password"] = pwd
        keychain["nickname"] = "한태빈" // ← 실제 닉네임으로 변경
        router.isLoggedIn = true
    }
}
