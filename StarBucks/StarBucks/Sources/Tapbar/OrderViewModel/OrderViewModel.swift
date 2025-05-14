//
//  OrderViewModel.swift
//  StarBucks
//
//  Created by 한태빈 on 5/1/25.
//

import SwiftUI
import CoreLocation
import Moya    // ← Moya 추가

// MARK: - 더미 데이터
let dummyOrderDrinks: [OrderDrink] = [
    OrderDrink(name: "추천",                englishName: "Recommend",        imageName: "추천",               dot: true),
    OrderDrink(name: "아이스 카페 아메리카노", englishName: "Reserve Espresso", imageName: "아이스카페아메리카노", dot: true),
    OrderDrink(name: "카페 아메리카노",      englishName: "Reserve Drip",     imageName: "카페아메리카노",      dot: true),
    OrderDrink(name: "카푸치노",            englishName: "Dcaf Coffee",      imageName: "카푸치노",            dot: false),
    OrderDrink(name: "아이스 카푸치노",      englishName: "Espresso",         imageName: "아이스카푸치노",      dot: true),
    OrderDrink(name: "카라멜 마키아또",      englishName: "Blonde Coffee",    imageName: "카라멜마끼아또",      dot: true),
    OrderDrink(name: "아이스 카라멜 마키아또", englishName: "Cold Brew",        imageName: "아이스카라멜마끼아또", dot: true),
    OrderDrink(name: "아포가토/기타",        englishName: "Others",           imageName: "아포가토",            dot: false),
    OrderDrink(name: "럼 샷 코르타도",      englishName: "Brewed Coffee",    imageName: "럼샷코르타도",        dot: true),
    OrderDrink(name: "라벤더 카페 브레베",    englishName: "Teavana",          imageName: "라벤더카페브레베",    dot: true),
    OrderDrink(name: "병음료",              englishName: "RTD",              imageName: "병음료",              dot: false)
]

// MARK: - 탭 Enum
enum OrderTab: String, CaseIterable, Identifiable {
    case all = "전체 메뉴"
    case my = "나만의 메뉴"
    case cake = "홀케이크 예약"
    var id: String { self.rawValue }
}

enum OrderTotalTab: String, CaseIterable, Identifiable {
    case drink = "음료"
    case food = "푸드"
    case product = "상품"
    var id: String { self.rawValue }
}

enum StoreTab: String, CaseIterable, Identifiable {
    case nearby = "가까운 매장"
    case frequent = "자주가는 매장"
    var id: String { self.rawValue }
}

// MARK: - ViewModel
final class OrderViewModel: ObservableObject {
    // 1) Moya Provider for Kakao Local API
    private let kakaoProvider = MoyaProvider<KakaoLocalAPI>()

    // 2) Published properties
    @Published var stores: [Store] = []
    @Published var selectedTab: OrderTab = .all
    @Published var selectedTotalTab: OrderTotalTab = .drink
    @Published var isStoreSheetPresented = false
    @Published var StoreTab: StoreTab = .nearby  // store 탭 선택
    @Published var isMapMode: Bool = false       // 지도 모드 여부
    @Published var searchResults: [Store] = []    // 원격 검색 결과
    @Published var searchQuery: String = ""       // 검색어 바인딩

    // 3) 근처 스토어 정렬 로직
    var nearbyStores: [Store] {
        guard let userLocation = LocationManager.shared.currentLocation else {
            return stores
        }
        return stores.sorted {
            ($0.distance(from: userLocation) ?? .greatestFiniteMagnitude)
            <
            ($1.distance(from: userLocation) ?? .greatestFiniteMagnitude)
        }
    }

    // 4) 카테고리 뱃지 생성
    func categoryBadges(for category: String) -> [String] {
        var badges: [String] = []
        let normalized = category.uppercased()

        if normalized.contains("R") || normalized.contains("리저브") {
            badges.append("R")
        }
        if normalized.contains("DT") || normalized.contains("드라이브") {
            badges.append("D")
        }
        return badges
    }

    // 5) 현재 사용자 위치
    var currentUserLocation: CLLocation {
        LocationManager.shared.currentLocation
        ?? CLLocation(latitude: 37.5665, longitude: 126.9780) // 기본: 서울시청
    }

    // 6) 로컬 GeoJSON 기반 매장 검색
    func searchStores(around center: CLLocationCoordinate2D) {
        let loc = CLLocation(latitude: center.latitude, longitude: center.longitude)
        stores = loadStarbucksGeoJSON().filter {
            ($0.distance(from: loc) ?? .greatestFiniteMagnitude) < 10_000
        }
    }

    // 7) **Kakao Local API 키워드 검색**
    func searchPlace(_ keyword: String) {
        kakaoProvider.request(.search(keyword: keyword)) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSONSerialization.jsonObject(
                        with: response.data,
                        options: .mutableContainers
                    )
                    print("🔍 Kakao Search Result:", json)
                    // TODO: JSON 파싱 후 self.stores 또는 별도 @Published var에 할당
                } catch {
                    print("⚠️ JSON 파싱 실패:", error)
                }
            case let .failure(error):
                print("❌ 네트워크 에러:", error)
            }
        }
    }

    // 8) 초기화: 기본 매장 로드
    init() {
        stores = loadStarbucksGeoJSON()
    }
}
