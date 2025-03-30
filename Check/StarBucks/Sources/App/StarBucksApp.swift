import SwiftUI

@main
struct StarBucksApp: App {
    
    @State var container: DIContainer = .init()
    
    var body: some Scene {
        WindowGroup {
            LoginView(container: container)
                .environmentObject(container)
//            SBTabView(container: container)
//                .environmentObject(container)
        }
    }
}

