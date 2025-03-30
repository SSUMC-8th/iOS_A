//
//  DIContainer.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import SwiftUI


class DIContainer: ObservableObject {
    
    /// 네비게이션 라우타
    var navigationRouter: NavigationRoutable
    
    init(navigationRouter: NavigationRoutable = NavigationRouter()) {
        self.navigationRouter = navigationRouter
    }
}


