//
//  PlaceSearchResponse.swift
//  StarBucks
//
//  Created by LEE on 5/15/25.
//

import Foundation

struct PlaceSearchResponse: Codable {
    let results: [PlaceSearchResult]
}

struct PlaceSearchResult: Codable {
    let name: String
    let photos: [PlaceImage]?
}

struct PlaceImage: Codable {
    let photo_reference: String
}
