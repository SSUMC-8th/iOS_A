//
//  SignupViewModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/24/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupModel(nickName: "", email: "", password: "")
    
    @AppStorage("nickName") var nickName: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("password") var password: String = ""
    
    public func saveData() {
        
    }
}


