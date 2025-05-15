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
import Moya

@Observable
class OrderSheetViewModel {
    
    private let provider = MoyaProvider<MapAPITarget>()

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
        guard let url = Bundle.main.url(forResource: "starbucks_2025", withExtension: "geojson") else {
            completion(.failure(NSError(domain: "파일 못찾아요!", code: 404, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(StarbucksData.self, from: data)
            self.starBucksList = decoded.features
            
            updateDistance()
            
            let group = DispatchGroup()
            for i in starBucksList.indices {
                group.enter()
                fetchImage(for: starBucksList[i]) { url in
                    DispatchQueue.main.async {
                        self.starBucksList[i].imageURL = url
                    }
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                self.isLoading = false
                completion(.success(self.starBucksList))
            }
        } catch {
            completion(.failure(error))
            self.isLoading = false
        }
    }
    
    func searchStores(with keyword: String, completion: @escaping ([StarbucksFeature]) -> Void) {
        let filtered = starBucksList.filter {
            $0.properties.storeName.localizedCaseInsensitiveContains(keyword)
        }

        var updatedResults = filtered

        let group = DispatchGroup()

        for index in updatedResults.indices {
            group.enter()
            fetchImage(for: updatedResults[index]) { url in
                updatedResults[index].imageURL = url
                group.leave()
            }
        }

        group.notify(queue: .main) {
            completion(updatedResults)
        }
    }

    func fetchImage(for feature: StarbucksFeature, completion: @escaping (String?) -> Void) {
        let name = feature.properties.storeName

        provider.request(.searchPlace(keyword: name)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decoded = try JSONDecoder().decode(PlaceSearchResponse.self, from: response.data)
                        if let photoRef = decoded.results.first?.photos?.first?.photo_reference {
                            let url = self.makeImageURL(photoReference: photoRef)
                            completion(url)
                        } else {
                            completion(nil)
                        }
                    } catch {
                        print("디코딩 실패: \(error)")
                        completion(nil)
                    }
                case .failure(let error):
                    print("요청 실패: \(error)")
                    completion(nil)
                }
            }
        }
    
    func makeImageURL(photoReference: String, maxWidth: Int = 400) -> String {
        let apiKey = "YOUR_GOOGLE_API_KEY"
        return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=\(maxWidth)&photo_reference=\(photoReference)&key=\(apiKey)"
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
