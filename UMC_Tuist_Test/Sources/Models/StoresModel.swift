import Foundation
import CoreLocation

enum StoreType: String, CaseIterable, Hashable {
    case reserve = "리저브"
    case driveThru = "DT"
    case none = ""
    
    static func from(category: String) -> [StoreType] {
        var types: [StoreType] = []
        
        if category.contains(Self.reserve.rawValue) {
            types.append(.reserve)
        }
        
        if category.contains(Self.driveThru.rawValue) {
            types.append(.driveThru)
        }
        
        if types.isEmpty {
            types.append(.none)
        }
        return types
    }
}
struct FeatureCollection: Codable {
    let name: String
    let features: [Feature]
}

struct Feature: Codable, Identifiable {
    let properties: Properties
    let geometry: Geometry
    
    var id: UUID { UUID() }
}

struct Properties: Codable {
    let Seq: String
    let Sotre_nm: String
    let Address: String
    let Telephone: String
    let Category: String
    let Ycoordinate: Double
    let Xcoordinate: Double
}

extension Properties {
    var storeTypes: [StoreType] {
        StoreType.from(category: Category)
    }
}

struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
    
    var location: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
        }
}

extension Geometry {
    func reverseGeocode(completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinates[1], longitude: coordinates[0])
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                completion(nil)
            } else if let placemark = placemarks?.first {
                let address = [
                    placemark.administrativeArea,
                    placemark.locality,
                    placemark.thoroughfare,
                    placemark.subThoroughfare
                ]
                    .compactMap{ $0 }
                    .joined(separator: " ")
                
                completion(address)
            } else {
                completion(nil)
            }
        }
    }
}
