//
//  LoginViewModel.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/19/25.
//

import Foundation
<<<<<<< HEAD
import SwiftUI
=======
>>>>>>> 3ac10618351a88174c94584bd41ab7878e819cf5

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pwd: String = ""
<<<<<<< HEAD
    
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
=======
>>>>>>> 3ac10618351a88174c94584bd41ab7878e819cf5
}
