//
//  StoreModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 5/1/25.
//

import Foundation
import CoreLocation
import Observation

enum StoreCategory: String, Codable {
    case reserve = "리저브"
    case driveThrough = "DT"
    case none
    
    static func category(from string: String?) -> [StoreCategory] {
        var categories: [StoreCategory] = []
        if let string = string {
            if string.contains("리저브") { categories.append(.reserve) }
            if string.contains("DT") { categories.append(.driveThrough) }
        }
        return categories.isEmpty ? [.none] : categories
    }
}

struct Store: Identifiable, Codable {
    var id = UUID()
    let Sotre_nm: String
    let latitude: Double
    let longitude: Double
    let category: [StoreCategory]
    let imageUrl: String? // 나중에 사진 넣을 자리
    
    var location: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
}
