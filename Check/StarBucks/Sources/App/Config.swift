//
//  Config.swift
//  StarBucks
//
//  Created by LEE on 5/15/25.
//

import Foundation

enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let baseURL: String = {
        guard let baseURL = Config.infoDictionary["API_URL"] as? String else {
            fatalError()
        }
        return baseURL
    }()
    
    static let apiKey: String = {
        guard let apiKey = Config.infoDictionary["API_KEY"] as? String else {
            fatalError()
        }
        return apiKey
    }()
    
    static let mapAPIKey: String = {
        guard let mapAPIKey = Config.infoDictionary["Map_API_KEY"] as? String else {
            fatalError()
        }
        return mapAPIKey
    }()
}
