import SwiftUI
import SwiftData
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct StarBucksApp: App {
    
    @State var container: DIContainer = .init()
    
    init() {
        KakaoSDK.initSDK(appKey: Config.apiKey)

    }
    
    var body: some Scene {
        WindowGroup {
            let keychain = KeychainService.shared
            let service = "com.example.StarBucks"
                    
            let savedId = UserDefaults.standard.string(
                forKey: "savedAccount"
            ) ?? ""
            let savedPassword = keychain.load(
                account: savedId,
                service: service
            ) ?? ""

            Group {
                if !savedId.isEmpty && !savedPassword.isEmpty {
                    SBTabView(container: container)
                } else {
                    LoginView(container: container)
                        .onOpenURL { url in
                            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                                _ = AuthController.handleOpenUrl(url: url)
                            }
                        }
                }
            }
            .modelContainer(for: ReceiptModel.self)
            .environmentObject(container)

        }
    }
}

