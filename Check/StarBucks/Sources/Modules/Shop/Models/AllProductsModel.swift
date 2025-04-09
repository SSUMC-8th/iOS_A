//
//  AllProductsModel.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import Foundation
import SwiftUI

struct AllProductsModel: Identifiable {
    
    let id = UUID()
    
    let category: ProductsCategory
    
    var image: Image {
        switch category {
        case .coffee:
            Icon.coffee_product.image
        case .gift:
            Icon.gift_product.image
        case .lifestyle:
            Icon.lifestyle_product.image
        case .mug:
            Icon.mug_product.image
        case .thermos:
            Icon.thermos_product.image
        case .tumbler:
            Icon.tumblur_product.image
        }
    }
}

enum ProductsCategory: String {
    case tumbler
    case coffee
    case gift
    case thermos
    case mug
    case lifestyle
    
    var title: String {
        switch self {
        case .coffee:
            return "커피 용품"
        case .gift:
            return "선물세트"
        case .tumbler:
            return "텀블러"
        case .lifestyle:
            return "라이프스타일"
        case .mug:
            return "머그/컵"
        case .thermos:
            return "보온병"
        }
    }
}
