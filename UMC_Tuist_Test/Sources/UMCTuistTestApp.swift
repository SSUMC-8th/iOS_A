import SwiftUI

@main
struct UMCTuistTestApp: App {
    @StateObject private var kakaoLoginManager = KakaoLoginManager()

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(kakaoLoginManager)
                .onOpenURL { url in
                    if url.absoluteString.starts(with: "myapp://oauth") {
                        kakaoLoginManager.handleRedirectURL(url)
                    }
                }
        }
    }
}

