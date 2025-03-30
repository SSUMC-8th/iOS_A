//
//  NavigationRoutingView.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import SwiftUI

struct NavigationRoutingView: View {
    
    @State var destination: NavigationDestination
    
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        switch destination {
        case .signUpView:
            SignUpView(container: container)
                .environmentObject(container)
        case .tabView:
            SBTabView()
                .environmentObject(container)
//        case .coffeDetailView(container: container)
//                .environmentObject(container)
        }
    }
}
