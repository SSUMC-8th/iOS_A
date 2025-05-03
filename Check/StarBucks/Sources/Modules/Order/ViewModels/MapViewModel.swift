//
//  MapViewModel.swift
//  StarBucks
//
//  Created by LEE on 5/3/25.
//

import Foundation
import SwiftUI
import MapKit

@Observable
class MapViewModel {
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
}
