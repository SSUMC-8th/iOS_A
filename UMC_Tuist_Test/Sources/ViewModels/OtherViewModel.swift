//
//  OtherViewModel.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/23/25.
//

import Foundation
import SwiftUI

class OtherViewModel: ObservableObject {
    @Published var signupModel = SignupModel(nickname: "", email: "", password: "")
    
    @AppStorage("nickname") private var storedNickname: String = ""
}
