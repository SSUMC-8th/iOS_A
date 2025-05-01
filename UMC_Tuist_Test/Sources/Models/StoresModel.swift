import Foundation
import CoreLocation

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

struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
    
    var location: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
        }
}
