//
//  NavigationRouter.swift
//  StarBucks
//
//  Created by 한태빈 on 4/1/25.
//

import SwiftUI
import Combine
import KeychainAccess

class NavigationRouter: ObservableObject {
    @Published var isLoggedIn: Bool = false

    private let keychain = Keychain(service: "com.yourapp.identifier")

    init() {
        if let _ = keychain["userId"], let _ = keychain["password"] {
            self.isLoggedIn = true
        }
    }
}
