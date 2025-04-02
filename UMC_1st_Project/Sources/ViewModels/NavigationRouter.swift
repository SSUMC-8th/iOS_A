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

    func navigateToCoffeeDetails(coffee: CoffeeType) {
        path.append(coffee)
    }

    func goBack() {
        path.removeLast()
    }
}
