//
//  ShopViewModel.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import Foundation
import SwiftUI

@Observable
class ShopViewModel {
    
    var onlineStoreModels: [OnlineStoreModel] = [
        .init(storeCase: .store1),
        .init(storeCase: .store2),
        .init(storeCase: .store3)
    ]
    
    var allProductModels: [AllProductsModel] = [
        .init(category: .coffee),
        .init(category: .gift),
        .init(category: .lifestyle),
        .init(category: .mug),
        .init(category: .thermos),
        .init(category: .tumbler)
    ]
    
    var bestItemModels: [ItemModel] = [
        .init(title: "best1", image: Icon.best1.image),
        .init(title: "best2", image: Icon.best2.image),
        .init(title: "best3", image: Icon.best3.image),
        .init(title: "best4", image: Icon.best4.image),
        .init(title: "best5", image: Icon.best5.image),
        .init(title: "best6", image: Icon.best6.image),
        .init(title: "best7", image: Icon.best7.image),
        .init(title: "best8", image: Icon.best8.image)
    ]
    
    var newProductModels: [ItemModel] = [
        .init(title: "new1", image: Icon.new1.image),
        .init(title: "new2", image: Icon.new2.image),
        .init(title: "new3", image: Icon.new3.image),
        .init(title: "new4", image: Icon.new4.image)
    ]
}
