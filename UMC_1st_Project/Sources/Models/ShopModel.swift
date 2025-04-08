//
//  ShopModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/8/25.
//

import Foundation

struct Product: Hashable {
    let name: String
    let imageName: String
}

enum ShopModel {
    static let bestItemPages: [[Product]] = [
        [
            Product(name: "그린 사이렌 슬리브 머그\n355ml", imageName: "aaaaa"),
            Product(name: "그린 사이렌 클래식 머그\n355ml", imageName: "CaramelMacchiato"),
            Product(name: "사이렌 머그 앤 우드 소서\n ", imageName: "IcedCaramelMacchiato"),
            Product(name: "리저브 골드 테일 머그\n355ml", imageName: "IcedCaffeAmericano")
        ],
        [
            Product(name: "블랙 앤 골드 머그\n473ml", imageName: "너티 크루아상"),
            Product(name: "블랙 링 머그\n355ml", imageName: "너티 크루아상"),
            Product(name: "북청사자놀음 데미머그\n355ml", imageName: "너티 크루아상"),
            Product(name: "서울 제주 데미머그 세트\n ", imageName: "너티 크루아상")
        ]
    ]
    
    static let newProducts: [Product] = [
            Product(name: "그린 사이렌 도트 머그\n237ml", imageName: "CaffeAmericano"),
            Product(name: "그린 사이렌 도트 머그\n355ml", imageName: "EspressoMacchiato"),
            Product(name: "홈 카페 미니 머그 세트", imageName: "EspressoMacchiato"),
            Product(name: "홈 카페 글라스 세트", imageName: "EspressoMacchiato")
        ]
}
