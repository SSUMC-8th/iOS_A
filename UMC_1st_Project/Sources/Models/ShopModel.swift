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
            Product(name: "그린 사이렌 슬리브 머그\n355ml", imageName: "bestItems_1"),
            Product(name: "그린 사이렌 클래식 머그\n355ml", imageName: "bestItems_2"),
            Product(name: "사이렌 머그 앤 우드 소서\n ", imageName: "bestItems_3"),
            Product(name: "리저브 골드 테일 머그\n355ml", imageName: "bestItems_4")
        ],
        [
            Product(name: "블랙 앤 골드 머그\n473ml", imageName: "bestItems_5"),
            Product(name: "블랙 링 머그\n355ml", imageName: "bestItems_6"),
            Product(name: "북청사자놀음 데미머그\n355ml", imageName: "bestItems_7"),
            Product(name: "서울 제주 데미머그 세트\n ", imageName: "bestItems_8")
        ]
    ]
    
    static let newProducts: [Product] = [
            Product(name: "그린 사이렌 도트 머그\n237ml", imageName: "newProducts_1"),
            Product(name: "그린 사이렌 도트 머그\n355ml", imageName: "newProducts_2"),
            Product(name: "홈 카페 미니 머그 세트", imageName: "newProducts_3"),
            Product(name: "홈 카페 글라스 세트", imageName: "newProducts_4")
        ]
}
