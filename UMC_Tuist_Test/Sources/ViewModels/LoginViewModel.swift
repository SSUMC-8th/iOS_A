//
//  LoginViewModel.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/19/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pwd: String = ""
    
    @AppStorage("email") private var storedEmail: String = ""
    @AppStorage("password") private var storedPassword: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    func login() -> Bool {
        if id == storedEmail && pwd == storedPassword {
            isLoggedIn = true
            return true
        } else {
            return false
        }
    }
}
