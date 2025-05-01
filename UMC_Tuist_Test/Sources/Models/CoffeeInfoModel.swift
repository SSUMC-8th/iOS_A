//
//  CoffeeInfoModel.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/29/25.
//

import Foundation

//struct CoffeeInfoModel {
//    let id = UUID()
//    var CoffeeImage: String
//    var CoffeeKoreanName: String
//    var CoffeeEnglishName: String
//}

enum TemperatureOption: String{
    case hot = "HOT", iced = "ICED"
}

enum CoffeeInfoModel: CaseIterable{
    case IceCaramelMacchiato
    case CaramelMacchiato
    case IceCafeAmericano
    case CafeAmericano
    case EspressoConPanna
    case EspressoMacchiato
    
    func CircleImageName() -> String {
        switch self {
        case .IceCaramelMacchiato:
            return "아이스 카라멜 마끼아또"
        case .CaramelMacchiato:
            return "카라멜 마끼아또"
        case .IceCafeAmericano:
            return "아이스 카페 아메리카노"
        case .CafeAmericano:
            return "카페 아메리카노"
        case .EspressoConPanna:
            return "에스프레소 콘 파나"
        case .EspressoMacchiato:
            return "에스프레소 마끼아또"
        }
    }
    
    func returnImageName() -> String {
        switch self {
        case .IceCaramelMacchiato:
            return "아이스 카라멜 마끼아또1"
        case .CaramelMacchiato:
            return "카라멜 마끼아또1"
        case .IceCafeAmericano:
            return "아이스 카페 아메리카노1"
        case .CafeAmericano:
            return "카페 아메리카노1"
        case .EspressoConPanna:
            return "에스프레소 콘 파나1"
        case .EspressoMacchiato:
            return "에스프레소 마끼아또1"
        }
    }
    
    func returnKoreanName() -> String {
        switch self {
        case .IceCaramelMacchiato:
            return "아이스 카라멜 마끼아또"
        case .CaramelMacchiato:
            return "카라멜 마끼아또"
        case .IceCafeAmericano:
            return "아이스 카페 아메리카노"
        case .CafeAmericano:
            return "카페 아메리카노"
        case .EspressoConPanna:
            return "에스프레소 콘 파나"
        case .EspressoMacchiato:
            return "에스프레소 마끼아또"
        }
    }
    
    func returnEnglishName() -> String {
        switch self {
        case .IceCaramelMacchiato:
            return "Ice Caramel Macchiato"
        case .CaramelMacchiato:
            return "Caramel Macchiato"
        case .IceCafeAmericano:
            return "Ice Cafe Americano"
        case .CafeAmericano:
            return "Cafe Americano"
        case .EspressoConPanna:
            return "Espresso Con Panna"
        case .EspressoMacchiato:
            return "Espresso Macchiato"
        }
    }
    
    func returnInfo() -> String {
        switch self {
        case .IceCaramelMacchiato:
            return "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료"
        case .CaramelMacchiato:
            return "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료"
        case .IceCafeAmericano:
            return "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피"
        case .CafeAmericano:
            return "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피"
        case .EspressoConPanna:
            return "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료"
        case .EspressoMacchiato:
            return "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료"
        }
    }
    
    func returnPrice() -> String {
        switch self {
        case .IceCaramelMacchiato:
            return "6,100원"
        case .CaramelMacchiato:
            return "6,100원"
        case .IceCafeAmericano:
            return "4,700원"
        case .CafeAmericano:
            return "4,700원"
        case .EspressoConPanna:
            return "4,100원"
        case .EspressoMacchiato:
            return "3,900원"
        }
    }
    
    /* 0: hot only, 1: cold only, 2: both*/
    func returnTemperature() -> Int {
        switch self {
        case .IceCaramelMacchiato:
            return 2
        case .CaramelMacchiato:
            return 2
        case .IceCafeAmericano:
            return 2
        case .CafeAmericano:
            return 2
        case .EspressoConPanna:
            return 0
        case .EspressoMacchiato:
            return 1
        }
    }
    
    
    //열거형으로
}
