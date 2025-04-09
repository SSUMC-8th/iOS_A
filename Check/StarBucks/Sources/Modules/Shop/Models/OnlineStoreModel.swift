//
//  OnlineStoreModel.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import Foundation
import SwiftUI

struct OnlineStoreModel: Identifiable {
    let storeCase: OnlineStoreCase
    
    let id = UUID()
    
    var image: Image {
        switch storeCase {
        case .store1:
            return Icon.store1.image
        case .store2:
            return Icon.store2.image
        case .store3:
            return Icon.store3.image
        }
    }
}

enum OnlineStoreCase {
    case store1
    case store2
    case store3
    
}
