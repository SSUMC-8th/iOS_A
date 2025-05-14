import Foundation
import SwiftUI

enum SegmentType: String, CaseIterable, Identifiable {
    case allMenu = "전체 메뉴"
    case myMenu = "나만의 메뉴"
    case cakeReservation = "홀케이크 예약"
    
    var id: String {rawValue}
    
    var textColor: Color {
        switch self {
        case .allMenu: return .black
        case .myMenu: return .black
        case .cakeReservation: return .green01
        }
    }
    
    var imageName: String? {
        switch self {
        case .cakeReservation: return "cake"
        default : return nil
        }
    }
}

enum AllSegmentType: String, CaseIterable, Identifiable {
    case beverage = "음료"
    case food = "푸드"
    case product = "상품"
    
    var id: String {rawValue}
}

enum OrderModel: CaseIterable{
    case Recomendation
    case IceCafeAmericano
    case CafeAmericano
    case Capuccino
    case IceCapuccino
    case CaramelMacchiato
    case IceCaramelMacchiato
    case Affogato
    case RumShotCortado
    case LavenderCafeBreve
    case BottledDrink
    
    func CircleImageName() -> String {
        switch self {
        case .Recomendation:
            return "추천"
        case .IceCafeAmericano:
            return "아이스 카페 아메리카노2"
        case .CafeAmericano:
            return "카페 아메리카노2"
        case .Capuccino:
            return "카푸치노"
        case .IceCapuccino:
            return "아이스 카푸치노"
        case .CaramelMacchiato:
            return "카라멜 마키아또_"
        case .IceCaramelMacchiato:
            return "아이스 카라멜 마키아또_"
        case .Affogato:
            return "아포가토"
        case .RumShotCortado:
            return "럼 샷 코르타도"
        case .LavenderCafeBreve:
            return "라벤터 카페 브레베"
        case .BottledDrink:
            return "병음료"
        }
    }
        
    func BeverageKoreaName() -> String {
        switch self {
        case .Recomendation:
            return "추천"
        case .IceCafeAmericano:
            return "아이스 카페 아메리카노"
        case .CafeAmericano:
            return "카페 아메리카노"
        case .Capuccino:
            return "카푸치노"
        case .IceCapuccino:
            return "아이스 카푸치노"
        case .CaramelMacchiato:
            return "카라멜 마키아또"
        case .IceCaramelMacchiato:
            return "아이스 카라멜 마키아또"
        case .Affogato:
            return "아포가토/기타"
        case .RumShotCortado:
            return "럼 샷 코르타도"
        case .LavenderCafeBreve:
            return "라벤터 카페 브레베"
        case .BottledDrink:
            return "병음료"
        }
    }
    
    func BeverageEnglishName() -> String {
        switch self {
        case .Recomendation:
            return "Recommend"
        case .IceCafeAmericano:
            return "Reserve Espresso"
        case .CafeAmericano:
            return "Reserve Drip"
        case .Capuccino:
            return "Dcaf Coffee"
        case .IceCapuccino:
            return "Espresso"
        case .CaramelMacchiato:
            return "Blonde Coffee"
        case .IceCaramelMacchiato:
            return "Cold Brew"
        case .Affogato:
            return "Others"
        case .RumShotCortado:
            return "Brewed Coffee"
        case .LavenderCafeBreve:
            return "Teavana"
        case .BottledDrink:
            return "RTD"
        }
    }
    
    func IsThereDot() -> Bool {
        switch self {
        case .Recomendation:
            return true
        case .IceCafeAmericano:
            return true
        case .CafeAmericano:
            return true
        case .IceCapuccino:
            return true
        case .CaramelMacchiato:
            return true
        case .IceCaramelMacchiato:
            return true
        case .RumShotCortado:
            return true
        case .LavenderCafeBreve:
            return true
        default:
            return false
        }
    }
}

enum StoreCategory: String, CaseIterable {
    case reserve = "리저브 매장"
    case dt = "DT 매장"
    case none = ""
    
    init(from raw: String) {
        if raw.contains("리저브") {
            self = .reserve
        } else if raw.contains("DT") {
            self = .dt
        } else {
            self = .none
        }
    }
    
    var imageName: String? {
        switch self {
        case .reserve: return "R"
        case .dt: return "D"
        case .none: return nil
        }
    }
}

