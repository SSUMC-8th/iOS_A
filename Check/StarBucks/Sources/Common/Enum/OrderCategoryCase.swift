//
//  OrderCategoryCase.swift
//  StarBucks
//
//  Created by LEE on 5/1/25.
//

import Foundation

enum OrderCategoryCase: String, CaseIterable {
    
    case beverage = "음료"
    case food = "푸드"
    case commodity = "상품"
    
    var title: String {
        self.rawValue
    }
}
