//
//  OrderSegmentCase.swift
//  StarBucks
//
//  Created by LEE on 5/1/25.
//

import Foundation
import SwiftUI

enum OrderSegmentCase: String, CaseIterable, SegmentProtocol {
    
    case all = "전체 메뉴"
    case mine = "나만의 메뉴"
    case cake = "홀케이크 예약"
    
    var segmentTitle: String {
        self.rawValue
    }
    
    var isButton: Bool {
        return self == .cake
    }
    
    var image: Image? {
        return self == .cake ? Icon.cake.image : nil
    }
}

protocol SegmentProtocol: Hashable {
    
    var segmentTitle: String { get }
    
    var image: Image? { get }
    
    var isButton: Bool { get }
    
}
