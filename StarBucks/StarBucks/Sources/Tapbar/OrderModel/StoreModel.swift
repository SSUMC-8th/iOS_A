//
//  StoreModel.swift
//  StarBucks
//
//  Created by 한태빈 on 5/1/25.
//

import SwiftUI
import CoreLocation

struct GeoJSONFeatureCollection: Codable {
    let type: String
    let features: [GeoJSONFeature]
}

struct GeoJSONFeature: Codable {
    let type: String
    let properties: StoreProperties
    let geometry: Geometry
}

struct StoreProperties: Codable {
    let name: String
    let address: String?
    let tel: String?
    let category: String?

    enum CodingKeys: String, CodingKey {
        case name = "Store_nm"  
        case address = "Address"
        case tel = "Telephone"
        case category = "Category"
    }
}


struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

struct Store: Identifiable {
    var id: String { "\(name)-\(address)" }
    let name: String
    let address: String
    let tel: String
    let category: String
    let location: CLLocationCoordinate2D
    
    
    func distance(from location: CLLocation?) -> CLLocationDistance? {
        guard let location else { return nil }
        let storeLocation = CLLocation(latitude: self.location.latitude, longitude: self.location.longitude)
        return location.distance(from: storeLocation)
    }
    
    
}

