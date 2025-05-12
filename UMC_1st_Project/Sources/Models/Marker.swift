//
//  Marker.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 5/3/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
