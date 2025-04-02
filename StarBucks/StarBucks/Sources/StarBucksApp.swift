import SwiftUI

@main
struct StarBucksApp: App {
    @StateObject var router = NavigationRouter()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(router)
            }
        }
    }
}
