import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct StarBucksApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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

// AppDelegate 추가
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // 1) Config.xcconfig → Info.plist 순서로 주입된 값 읽어오기
        guard let kakaoKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_NATIVE_APP_KEY") as? String,
              let osrmURL  = Bundle.main.object(forInfoDictionaryKey: "OSRM_BASE_URL")  as? String
        else {
            assertionFailure("⚠️ Config 값이 읽히지 않습니다!")
            return false
        }

        // 2) 콘솔에 찍어보기
        print("🌟 Kakao NATIVE API Key:", kakaoKey)
        print("🌟 OSRM Base URL:", osrmURL)

        // 3) Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoKey)

        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            return AuthController.handleOpenUrl(url: url)
        }
        return false
    }
}
