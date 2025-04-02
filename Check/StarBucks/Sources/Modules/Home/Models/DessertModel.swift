//
//  DessertModel.swift
//  StarBucks
//
//  Created by LEE on 4/1/25.
//

import Foundation
import SwiftUI

struct DessertModel: Identifiable {
    
    /// UUID
    let id = UUID()
    
    /// 디저트 메뉴 이름
    let title: String
    
    /// 디저트 메뉴 이미지
    let image: Image
}
