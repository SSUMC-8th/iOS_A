//
//  StarBucksModel.swift
//  StarBucks
//
//  Created by LEE on 5/3/25.
//

import Foundation

struct StarbucksData: Codable {
    let type: String
    let name: String
    let features: [StarbucksFeature]
}

struct StarbucksFeature: Codable, Identifiable {
    var id = UUID()
    let type: String
    let properties: StarbucksProperties
    let geometry: Geometry
    var distanceKm: Double?

    var imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case properties = "properties"
        case geometry = "geometry"
    }
}

struct StarbucksProperties: Codable {
    let seq: String
    let storeName: String
    let address: String
    let telephone: String
    let category: StoreCategory
    let yCoordinate: Double
    let xCoordinate: Double

    enum CodingKeys: String, CodingKey {
        case seq = "Seq"
        case storeName = "Sotre_nm"
        case address = "Address"
        case telephone = "Telephone"
        case category = "Category"
        case yCoordinate = "Ycoordinate"
        case xCoordinate = "Xcoordinate"
    }
}

struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

enum StoreCategory: String, Codable {
    
    case reserve = "리저브 매장"
    case dt = "DT 매장"
    case none = ""
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        self = StoreCategory(rawValue: raw) ?? .none
    }
}
