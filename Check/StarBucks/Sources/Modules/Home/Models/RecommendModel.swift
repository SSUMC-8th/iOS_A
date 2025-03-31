//
//  RecommendModel.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import Foundation
import SwiftUI

struct RecommendModel: Identifiable {
    
    let menu: Menu
    
    let id = UUID()
    
}


enum Menu: Hashable {
    
    case Iced_Caramel_Macchiato
    case Caramel_Macchiato
    case Iced_Caffe_Americano
    case Caffe_Americano
    case Espresso_Con_tana
    case Espresso_Macchiato
    
    /// 메뉴 가격
    var price: String {
        switch self {
        case .Iced_Caramel_Macchiato:
            return "6,100원"
        case .Caramel_Macchiato:
            return "6,100원"
        case .Iced_Caffe_Americano:
            return "4,700원"
        case .Caffe_Americano:
            return "4,700원"
        case .Espresso_Con_tana:
            return "4,100원"
        case .Espresso_Macchiato:
            return "3,900원"
        }
    }
    
    /// 한글 메뉴
    var koreanName: String {
        switch self {
        case .Iced_Caramel_Macchiato:
            return "아이스 카라멜 마끼야또"
        case .Caramel_Macchiato:
            return "카라멜 마끼아또"
        case .Iced_Caffe_Americano:
            return "아이스 카페 아메리카노"
        case .Caffe_Americano:
            return "카페 아메리카노"
        case .Espresso_Con_tana:
            return "에스프레소 콘 파나"
        case .Espresso_Macchiato:
            return "에스프레소 마끼아또"
        }
    }
    
    /// 영어 메뉴
    var englishName: String {
        switch self {
        case .Iced_Caramel_Macchiato:
            return "Iced Caramel Macchiato"
        case .Caramel_Macchiato:
            return "Caramel Macchiato"
        case .Iced_Caffe_Americano:
            return "Iced Caffe Americano"
        case .Caffe_Americano:
            return "Caffe Americano"
        case .Espresso_Con_tana:
            return "Espresso Con Panna"
        case .Espresso_Macchiato:
            return "Espresso Macchiato"
        }
    }
    
    /// 메뉴 설명
    var decription: String {
        switch self {
        case .Iced_Caramel_Macchiato:
            return "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료"
        case .Caramel_Macchiato:
            return "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료"
        case .Iced_Caffe_Americano:
            return "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피"
        case .Caffe_Americano:
            return "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피"
        case .Espresso_Con_tana:
            return "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료"
        case .Espresso_Macchiato:
            return "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료"
        }
    }
    
    /// 메뉴 썸네일 이미지
    var thumnNailImage: Image {
        switch self {
        case .Iced_Caramel_Macchiato:
            return Icon.coffee_ice_caramel.image
        case .Caramel_Macchiato:
            return Icon.coffee_caramel.image
        case .Iced_Caffe_Americano:
            return Icon.coffee_americano.image
        case .Caffe_Americano:
            return Icon.coffee_americano.image
        case .Espresso_Con_tana:
            return Icon.coffee_contana.image
        case .Espresso_Macchiato:
            return Icon.coffee_espresso.image
        }
    }
    
    /// 메뉴 대표 이미지
    var image: Image {
        switch self {
        case .Iced_Caramel_Macchiato:
            return Icon.ice_caramel_macchiato.image
        case .Caramel_Macchiato:
            return Icon.caramel_macchiato.image
        case .Iced_Caffe_Americano:
            return Icon.cafe_americano.image
        case .Caffe_Americano:
            return Icon.ice_cafe_americano.image
        case .Espresso_Con_tana:
            return Icon.espresso_conpana.image
        case .Espresso_Macchiato:
            return Icon.espresso_macchiato.image
        }
    }
    
    enum Temperature: Hashable {
        case ice
        case hot
        case iceOnly
        case hotOnly
    }
    
    var temperature: Temperature {
        switch self {
        case .Iced_Caramel_Macchiato, .Iced_Caffe_Americano:
            return .ice
        case .Caramel_Macchiato, .Caffe_Americano:
            return .hot
        case .Espresso_Con_tana:
            return .iceOnly
        case .Espresso_Macchiato:
            return .hotOnly
        }
    }
}
