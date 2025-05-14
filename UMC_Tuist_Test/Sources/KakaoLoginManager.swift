import Foundation
import Alamofire
import SwiftUI

class KakaoLoginManager: ObservableObject {
    @Published var accessToken: String? = nil
    
    private let restApiKey = "d06d7931fc0fb9ea5eea5e069f635518"
    private let redirectURI = "myapp://oauth"
    
    func handleRedirectURL(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let code = components.queryItems?.first(where: { $0.name == "code" })?.value else {
            print("No code found in URL")
            return
        }
                
        print("Authorization code:", code)
    }
    
    private func requestToken(with code: String) {
        let url = "https://kauth.kakao.com/oauth/token"
        
        let parameters: Parameters = [
            "grant_type": "authorization_code",
            "client_id": restApiKey,
            "redirec_uri": redirectURI,
            "code": code
        ]
        
        AF.request(url, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: KakaoTokenResponse.self) { response in
                switch response.result {
                case .success(let tokenResponse):
                    print("액세스 토큰 받음: \(tokenResponse.access_token)")
                    self.accessToken = tokenResponse.access_token
                    
                    KeychainHelper.standard.save(tokenResponse.access_token, forKey: "kakaoAccessToken")
                    
                case .failure(let error):
                    print("토큰 요청 실패: \(error.localizedDescription)")
                }
            }
    }
}
