//
//  ItemModel.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import Foundation
import SwiftUI

struct ItemModel: Identifiable {
    
    let id = UUID()
    
    var title: String
    
    var image: Image
    
}
