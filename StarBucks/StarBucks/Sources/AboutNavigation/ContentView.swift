//
//  ContentView.swift
//  StarBucks
//
//  Created by 한태빈 on 4/1/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: NavigationRouter

    var body: some View {
        if router.isLoggedIn {
            TabbarView()
        } else {
            LoginView()
        }
    }
}
