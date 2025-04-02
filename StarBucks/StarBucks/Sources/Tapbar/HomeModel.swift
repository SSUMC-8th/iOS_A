import Foundation

// 개별 모델 정의
struct DessertModel {
    static let names = ["너티 크루아상", "매콤 소시지 불고기", "미니 리프 파이", "뺑 오 쇼콜라", "소시지&올리브 파이"]
}

struct WhatsnewModel1 {
    static let names = ["25년 3월 일회용컵 없는 날 캠페..", "스타벅스 ooo점을 찾습니다.", "2월 8일, 리저브 스프링 신규 커..."]
}

struct WhatsnewModel2 {
    static let names = ["매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요.", "스타벅스 커뮤니티 스토어 파트너를 운영할 기관을 공모합니다.", "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요."]
}

struct CoffeeModel {
    static let names = ["에스프레소 콘파나", "에스프레소 마키아또", "아이스 카페 아메리카노", "카페 아메리카노", "아이스 카라멜 마키아또", "카라멜 마키아또"]
}

// HomeModel에서 세 가지 모델의 데이터를 모아서 관리
struct HomeModel {
    let desserts: [String]
    let whatsnew: [String]
    let whatsnew2: [String]
    let coffees: [String]
    
    init() {
        self.desserts = DessertModel.names
        self.whatsnew = WhatsnewModel1.names
        self.whatsnew2 = WhatsnewModel2.names
        self.coffees = CoffeeModel.names
    }
}
