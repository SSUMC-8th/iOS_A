
/*
import SwiftUI

@main
struct UMC1stProjectApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
*/
import SwiftUI

@main
struct UMC_1st_ProjectApp: App {
    @StateObject private var router = NavigationRouter() // 네비게이션 관리 객체

    var body: some Scene {
        WindowGroup {
            if router.isLoggedIn {
                TabBarView(selection: .constant(4))
                    .environmentObject(router) // 환경 객체 주입
            } else {
                LoginView()
                    .environmentObject(router) // 환경 객체 주입
            }
        }
    }
}
