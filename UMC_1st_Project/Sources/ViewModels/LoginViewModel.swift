//
//  LoginViewModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/22/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var id: String = ""
    @Published var pw: String = ""
}
