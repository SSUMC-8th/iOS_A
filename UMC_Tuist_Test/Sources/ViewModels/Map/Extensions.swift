import CoreLocation

extension CLLocation {
    func distanceInKilometers(to location: CLLocation) -> Double {
        return self.distance(from: location) / 1000
    }
}
