import Foundation
import SwiftUI

class HomeViewModel {
    
    // MARK: - Properties
    /// 홈 모델
    var homeModel: HomeModel = .init()
    
    /// WhatsNew 모델
    var whatsNewModel: [WhatsNewModel] = [
        .init(title: "25년 3월 일회용컵 없는 날 캠페인", decription: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요.",
              image: Icon.recycle.image),
        .init(title: "스타벅스 ooo점을 찾습니다", decription: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다.", image: Icon.find_starbucks.image),
        .init(title: "2월 8일, 리저브 스프링 신규 커피 맛보세요.", decription: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.", image: Icon.reserve_spring.image)
    ]
    
    /// 추천 메뉴 모델
    var recommendModel: [RecommendModel] = [
        .init(menu: .Caffe_Americano),
        .init(menu: .Caramel_Macchiato),
        .init(menu: .Espresso_Con_tana),
        .init(menu: .Espresso_Macchiato),
        .init(menu: .Iced_Caffe_Americano),
        .init(menu: .Iced_Caramel_Macchiato)
    ]
    
    /// 디저트 모델
    var dessertModel: [DessertModel] = [
        .init(title: "너티 크루아상", image: Icon.nutty_croissant.image),
        .init(title: "매콤 소시지 불고기", image: Icon.spicy_sausage_bulgogi.image),
        .init(title: "미니 리프 파이", image: Icon.mini_leaf_pie.image),
        .init(title: "뺑 오 쇼콜라", image: Icon.pain_au_chocolat.image),
        .init(title: "소시지&올리브 파이", image: Icon.sausage_olive_pie.image)
    ]
    
    /// 보상 개수
    var rewardCount: Int = 1
    
    /// 닉네임
    var userNickname: String {
        homeModel.userNickname
    }
    
    
}


