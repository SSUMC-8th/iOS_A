//
//  NavigationRoutingView.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import SwiftUI

struct NavigationRoutingView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    // MARK: - @State
    /// 현재 화면
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case .signUpView:
            SignUpView(container: container)
                .environmentObject(container)
        case .tabView:
            SBTabView(container: container)
                .environmentObject(container)
        case .coffeeDetailView(let menu):
            CoffeeDetailView(container: container, menu: menu)
                .environmentObject(container)
        }
    }
}
