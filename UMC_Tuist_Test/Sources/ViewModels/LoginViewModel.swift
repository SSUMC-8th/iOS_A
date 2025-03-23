//
//  LoginViewModel.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/19/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pwd: String = ""
}
