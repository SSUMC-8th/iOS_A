//
//  RecommendModel.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import Foundation
import SwiftUI

struct RecommendModel: Identifiable {
    
    let id = UUID()
    
    let image: Image
    
    let name_kor: String
    
    let name_eng: String
    
    let description: String
    
    let price: Int
    
}
