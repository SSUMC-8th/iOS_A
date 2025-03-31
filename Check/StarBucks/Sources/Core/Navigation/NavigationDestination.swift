//
//  NavigationDestination.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import Foundation

enum NavigationDestination: Hashable {
    
    case signUpView /* 회원가입 화면 */
    case tabView /* 탭 뷰 */
    case coffeeDetailView(menu: Menu) /* 커피 상세정보 화면 */
    
    static func == (lhs: NavigationDestination, rhs: NavigationDestination) -> Bool {
        switch (lhs, rhs) {
        case (.signUpView, .signUpView):
            return true
        case (.tabView, .tabView):
            return true
        case (.coffeeDetailView(_), .coffeeDetailView(_)):
            return true
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .signUpView:
            hasher.combine("signUpView")
        case .tabView:
            hasher.combine("tabView")
        case .coffeeDetailView(let menu):
            hasher.combine("coffeeDetailView")
            hasher.combine(menu)

        }
    }
    

}
