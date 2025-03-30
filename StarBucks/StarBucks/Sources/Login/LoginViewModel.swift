//
//  LoginViewModel.swift
//  StarBucks
//
//  Created by 한태빈 on 3/25/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pwd: String = ""
}
