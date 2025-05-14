//
//  KakaoLoginViewModel.swift
//  StarBucks
//
//  Created by 한태빈 on 5/14/25.
//
import Foundation
import KakaoSDKUser
import KeychainAccess
import SwiftUI

class KakaoLoginViewModel: ObservableObject {
    private let keychain = Keychain(service: "com.yourapp.identifier")

    func loginWithKakao(router: NavigationRouter) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { _, error in
                if let error = error {
                    print("카카오톡 로그인 실패: \(error.localizedDescription)")
                } else {
                    print("카카오톡 로그인 성공")
                    self.fetchUserInfo(router: router)
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { _, error in
                if let error = error {
                    print("카카오계정 로그인 실패: \(error.localizedDescription)")
                } else {
                    print("카카오계정 로그인 성공")
                    self.fetchUserInfo(router: router)
                }
            }
        }
    }

    func fetchUserInfo(router: NavigationRouter) {
        UserApi.shared.me { user, error in
            if let error = error {
                print("사용자 정보 요청 실패: \(error.localizedDescription)")
            } else if let user = user {
                let nickname = user.kakaoAccount?.profile?.nickname ?? ""
                let email = user.kakaoAccount?.email ?? ""

                print("닉네임: \(nickname), 이메일: \(email)")

                self.keychain["nickname"] = nickname
                self.keychain["userId"] = email
                self.keychain["loginType"] = "kakao"

                DispatchQueue.main.async {
                    router.isLoggedIn = true
                }
            }
        }
    }
}
