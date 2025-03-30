//
//  SBTabCase.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import Foundation
import SwiftUI

enum SBTabCase: String, CaseIterable {
    
    case home = "home"
    case pay = "pay"
    case order = "order"
    case shop = "shop"
    case other = "other"
    
    /// 이미지 asset의 이름 리턴
    var imageName: String {
        return self.rawValue
    }
    
    /// 이미지 asset의 이름 리턴
    var selectedImageName: String {
        return self.imageName + "_selected"
    }
    
}
