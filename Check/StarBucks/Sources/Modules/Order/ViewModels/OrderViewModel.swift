//
//  OrderViewModel.swift
//  StarBucks
//
//  Created by LEE on 5/1/25.
//

import Foundation
import SwiftUI

@Observable
class OrderViewModel {
    
    var menuModel: [RecommendModel] = [
        .init(menu: .Caffe_Americano),
        .init(menu: .Caramel_Macchiato),
        .init(menu: .Iced_Cappuccino),
        .init(menu: .Cafuchino),
        .init(menu: .Iced_Caffe_Americano),
        .init(menu: .Iced_Caramel_Macchiato),
        .init(menu: .Affogato),
        .init(menu: .Rumshot_Cortado),
        .init(menu: .Lavender_Cafe_Breve),
        .init(menu: .Bottled_Drink)
    ]
    
    var selectedSegment: OrderSegmentCase = .all
    
    var selectedCategory: OrderCategoryCase = .beverage
    
}
