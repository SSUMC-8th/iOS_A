//
//  OrderSheetViewModel.swift
//  StarBucks
//
//  Created by LEE on 5/3/25.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

@Observable
class OrderSheetViewModel {
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var currentMapCenter: CLLocationCoordinate2D?
    
    var isLoading: Bool = false
    
    var starBucksList: [StarbucksFeature] = []
    
    var sortedStarBucksList: [StarbucksFeature] {
        starBucksList
        .filter { ($0.distanceKm != nil) && ($0.distanceKm! <= 10) }
            
        
    }
    
    
    init() {
        LocationManager.shared.requestAuthorization()
        LocationManager.shared.startUpdatingLocation()
    }
    
}

extension OrderSheetViewModel {
    
    func loadStarbucksData(
        completion: @escaping (Result<[StarbucksFeature], Error>) -> Void
    ) {
        
        isLoading = true
        print(isLoading)
        
        guard let url = Bundle.main.url(forResource: "starbucks_2025", withExtension: "geojson") else {
            print("json 파일 없음")
            completion(
                .failure(NSError(domain: "파일 못찾아요!", code: 404, userInfo: nil))
            )
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(
                StarbucksData.self,
                from: data
            )
            self.starBucksList = decoded.features
            print("디코딩 성공")
            updateDistance()
            completion(.success(decoded.features))
        } catch {
            print("디코딩 실패: \(error.localizedDescription)")
            completion(.failure(error))
        }
        
        isLoading = false
        print(isLoading)

    }

    private func updateDistance() {
        for i in 0..<starBucksList.count {
            let store = starBucksList[i]
            let destination = CLLocationCoordinate2D(latitude: store.properties.yCoordinate, longitude: store.properties.xCoordinate)
            let distance = calculateDistance(to: destination) ?? 0
            starBucksList[i].distanceKm = distance
        }
    }
    
    private func calculateDistance(to destination: CLLocationCoordinate2D) -> Double? {
        guard let userLocation = LocationManager.shared.currentLocation else {
            return nil
        }
        return userLocation
            .distance(
                from: CLLocation(
                    latitude: destination.latitude,
                    longitude: destination.longitude
                )
            ) / 1000
    }
}
