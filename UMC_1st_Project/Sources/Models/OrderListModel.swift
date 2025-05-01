//
//  OrderListModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/30/25.
//

import Foundation

struct CoffeeMenu {
    let name: String
    let description: String
    let imageName: String
}

let coffeeMenus = [
    CoffeeMenu(name: "추천", description: "Recommend", imageName: "에스프레소 마키아또"),
    CoffeeMenu(name: "아이스 카페 아메리카노", description: "Reserve Espresso", imageName: "아이스 카페 아메리카노"),
    CoffeeMenu(name: "카페 아메리카노", description: "Reserve Drip", imageName: "카페 아메리카노"),
    CoffeeMenu(name: "카푸치노", description: "Decaf Coffee", imageName: "카푸치노"),
    CoffeeMenu(name: "아이스 카푸치노", description: "Espresso", imageName: "아이스 카푸치노"),
    CoffeeMenu(name: "카라멜 마키아또", description: "Blonde Coffee", imageName: "카라멜 마키아또"),
    CoffeeMenu(name: "아이스 카라멜 마키아또", description: "Blonde Coffee", imageName: "아이스 카라멜 마키아또"),
    CoffeeMenu(name: "아포가토/기타", description: "Others", imageName: "아포가토"),
    CoffeeMenu(name: "럼 샷 코르타도", description: "Brewed Coffee", imageName: "럼 샷 코르타도"),
    CoffeeMenu(name: "라벤터 카페 브레베", description: "Teavana", imageName: "라벤터 카페 브레베"),
    CoffeeMenu(name: "병음료", description: "RTD", imageName: "병음료")
    
]
