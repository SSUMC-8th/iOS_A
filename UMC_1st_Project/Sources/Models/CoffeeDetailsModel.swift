//
//  CoffeeDetailsModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/1/25.
//

import Foundation



enum CoffeeTemperature: String, CaseIterable {
    case iced = "Iced"
    case hot = "Hot"
}

enum CoffeeType: CaseIterable {
    case EspressoConPanna
    case EspressoMacchiato
    case IcedCaffeAmericano
    case CaffeAmericano
    case IcedCaramelMacchiato
    case CaramelMacchiato
    
    
    
    func imageName() -> String {
        switch self {
        case .EspressoConPanna:
            return "EspressoConPanna"
        case .EspressoMacchiato:
            return "EspressoMacchiato"
        case .IcedCaffeAmericano:
            return "IcedCaffeAmericano"
        case .CaffeAmericano:
            return "CaffeAmericano"
        case .IcedCaramelMacchiato:
            return "IcedCaramelMacchiato"
        case .CaramelMacchiato:
            return "CaramelMacchiato"
        }
    }
    
    func name() -> String {
        switch self {
        case .EspressoConPanna:
            return "에스프레소 콘 파나"
        case .EspressoMacchiato:
            return "에스프레소 마키아또"
        case .IcedCaffeAmericano:
            return "아이스 카페 아메리카노"
        case .CaffeAmericano:
            return "카페 아메리카노"
        case .IcedCaramelMacchiato:
            return "아이스 카라멜 마키아또"
        case .CaramelMacchiato:
            return "카라멜 마키아또"
        }
    }
    
    func englishName() -> String {
        switch self {
        case .EspressoConPanna:
            return "Espresso Con Panna"
        case .EspressoMacchiato:
            return "Espresso Macchiato"
        case .IcedCaffeAmericano:
            return "Iced Caffe Americano"
        case .CaffeAmericano:
            return "Caffe Americano"
        case .IcedCaramelMacchiato:
            return "Iced Caramel Macchiato"
        case .CaramelMacchiato:
            return "Caramel Macchiato"
        }
    }
    
    func description() -> String {
        switch self {
        case .EspressoConPanna:
            return "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료"
        case .EspressoMacchiato:
            return "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료"
        case .IcedCaffeAmericano:
            return "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피"
        case .CaffeAmericano:
            return "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피"
        case .IcedCaramelMacchiato:
            return "향긋한 바닐라 시럽과 시원한 우유에 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후, 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료"
        case .CaramelMacchiato:
            return "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료"
        }
    }
    
    func price() -> String {
        switch self {
        case .EspressoConPanna:
            return "4,100원"
        case .EspressoMacchiato:
            return "3,900원"
        case .IcedCaffeAmericano:
            return "4,700원"
        case .CaffeAmericano:
            return "4,700원"
        case .IcedCaramelMacchiato:
            return "6,100원"
        case .CaramelMacchiato:
            return "6,100원"
        }
    }
    
    func availableTemperatures() -> [CoffeeTemperature] {
            switch self {
            case .EspressoConPanna:
                return [.hot]
            case .EspressoMacchiato:
                return [.iced]
            case .IcedCaffeAmericano, .CaffeAmericano:
                return [.iced, .hot]
            case .IcedCaramelMacchiato, .CaramelMacchiato:
                return [.iced, .hot]
            }
        }
    
}


