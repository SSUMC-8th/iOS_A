//
//  NavigationRouter.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/2/25.
//
import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var isLoggedIn: Bool = false // 로그인 상태 추가

    func navigateToCoffeeDetails(coffee: CoffeeType) {
        path.append(coffee)
    }

    func goBack() {
        path.removeLast()
    }

    func navigateToTabBar() {
        isLoggedIn = true // 로그인 성공 시 상태 변경
    }

    func logout() {
        isLoggedIn = false
        path = NavigationPath() // 로그아웃 시 네비게이션 초기화
    }
}
