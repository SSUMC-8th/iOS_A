//
//  DIContainer.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import SwiftUI


class DIContainer: ObservableObject {
    var navigationRouter: NavigationRoutable
    
    
    init(navigationRouter: NavigationRoutable = NavigationRouter()) {
        self.navigationRouter = navigationRouter
    }
}


