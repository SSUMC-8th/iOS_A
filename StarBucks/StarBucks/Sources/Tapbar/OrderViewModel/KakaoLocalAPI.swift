//
//  KakaoLocalAPI.swift
//  StarBucks
//
//  Created by 한태빈 on 5/15/25.
//

import Foundation
import Moya

/// 카카오 로컬 키워드 검색용 API
enum KakaoLocalAPI {
    case search(keyword: String, page: Int = 1, size: Int = 15)
}

extension KakaoLocalAPI: TargetType {
    // 1) Base URL: Info.plist에서 읽어오기
    var baseURL: URL {
        guard let urlString = Bundle.main.object(
                forInfoDictionaryKey: "KAKAO_LOCAL_BASE_URL"
              ) as? String,
              let url = URL(string: urlString)
        else {
            fatalError("❌ KAKAO_LOCAL_BASE_URL이 설정되지 않았습니다.")
        }
        return url
    }
    
    // 2) 엔드포인트 경로
    var path: String {
        switch self {
        case .search:
            return "/v2/local/search/keyword.json"
        }
    }
    
    // 3) HTTP Method
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    // 4) 요청 파라미터
    var task: Task {
        switch self {
        case let .search(keyword, page, size):
            return .requestParameters(
                parameters: [
                    "query": keyword,
                    "page": page,
                    "size": size
                ],
                encoding: URLEncoding.default
            )
        }
    }
    
    // 5) 샘플 데이터 (테스트용)
    var sampleData: Data { Data() }
    
    // 6) HTTP Headers
    var headers: [String: String]? {
        guard let restKey = Bundle.main.object(
                forInfoDictionaryKey: "KAKAO_REST_API_KEY"
              ) as? String
        else {
            fatalError("❌ KAKAO_REST_API_KEY가 설정되지 않았습니다.")
        }
        return [
            "Authorization": "KakaoAK \(restKey)"
        ]
    }
}
