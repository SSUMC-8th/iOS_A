//
//  MapAPITarget.swift
//  StarBucks
//
//  Created by LEE on 5/15/25.
//

import Foundation
import Moya

enum MapAPITarget {
    case searchPlace(keyword: String)
    case fetchPhoto(photoReference: String)
}

extension MapAPITarget: APITargetType {
    
    var baseURL: URL {
        switch self {
        case .searchPlace:
            return URL(string: "https://maps.googleapis.com/maps/api/place/textsearch")!
        case .fetchPhoto:
            return URL(string: "https://maps.googleapis.com/maps/api/place/photo")!
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var path: String {
        switch self {
        case .searchPlace:
            return "/json"
        case .fetchPhoto:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .searchPlace(let query):
            return .requestParameters(
                parameters: [
                    "query": query,
                    "key": Config.mapAPIKey
                ],
                encoding: URLEncoding.default
            )

        case .fetchPhoto(let photoReference):
            return .requestParameters(
                parameters: [
                    "photoreference": photoReference,
                    "maxwidth": 400,
                    "key": Config.mapAPIKey
                ],
                encoding: URLEncoding.default
            )
        }
    }
}
