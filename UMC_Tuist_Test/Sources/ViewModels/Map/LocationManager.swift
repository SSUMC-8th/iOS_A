import Foundation
import CoreLocation
import MapKit
import Observation

@Observable
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    // MARK: - CLLocationManager
    let locationManager = CLLocationManager()
    
    // MARK: - Published Properties
    var currentLocation: CLLocation?
    var currentHeading: CLHeading?
    
    var currentSpeed: CLLocationSpeed = 0
    var currentDirection: CLLocationDirection = 0
    
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    var currentAddress: String = "주소를 불러오는 중..."
    private let geocoder = CLGeocoder()
    
    var didEnterGeofence: Bool = false
    var didExitGeofence: Bool = false
    
    // MARK: - Init
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.headingFilter = kCLHeadingFilterNone
        
        requestAuthorization()
        startUpdatingLocation()
        startUpdatingHeading()
    }
    
    // MARK: - 권한 요청
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }

    // MARK: - 위치 추적
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: - 방향 추적
    func startUpdatingHeading() {
        locationManager.startUpdatingHeading()
    }
    
    func stopUpdatingHeading() {
        locationManager.stopUpdatingHeading()
    }

    // MARK: - Significant Location Change
    func startMonitoringSignificantLocationChanges() {
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func stopMonitoringSignificantLocationChanges() {
        locationManager.stopMonitoringSignificantLocationChanges()
    }
    
    // MARK: - 방문 감지
    func startMonitoringVisits() {
        locationManager.startMonitoringVisits()
    }

    // MARK: - 지오펜싱
    func startMonitoringGeofence(center: CLLocationCoordinate2D,
                                 radius: CLLocationDistance,
                                 identifier: String) {
        
        let region = CLCircularRegion(center: center,
                                      radius: radius,
                                      identifier: identifier)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        locationManager.startMonitoring(for: region)
        print("Monitoring regions registered: \(identifier)")
    }

    func stopMonitoringAllGeofences() {
        for region in locationManager.monitoredRegions {
            locationManager.stopMonitoring(for: region)
        }
    }
    
    func getDistance(form location: CLLocation) -> Double? {
        guard let currentLocation = currentLocation else { return nil }
        return currentLocation.distance(from: location) / 1000
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager {
    
    // 권한 변경 감지
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }

    // 위치 업데이트 감지 (기본 위치 추적 + Significant Change)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let latest = locations.last {
            DispatchQueue.main.async {
                self.currentLocation = latest
                self.currentSpeed = max(latest.speed, 0)
            }
        }
    }

    // 방향 감지
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        DispatchQueue.main.async {
            self.currentHeading = newHeading
            self.currentDirection = newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading
        }
    }

    // 방문 감지 (visit monitoring)
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        print("방문 감지됨 - 좌표: \(visit.coordinate), 도착: \(visit.arrivalDate), 출발: \(visit.departureDate)")
    }

    // 지오펜싱: 진입
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        DispatchQueue.main.async {
            self.didEnterGeofence = true
            self.didExitGeofence = false
        }
    }

    // 지오펜싱: 이탈
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        DispatchQueue.main.async {
            self.didEnterGeofence = false
            self.didExitGeofence = true
        }
    }

    // 오류 처리
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 오류: \(error.localizedDescription)")
    }
}

