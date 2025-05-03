//
//  MapView.swift
//  StarBucks
//
//  Created by LEE on 5/3/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var viewModel: MapViewModel = .init()
    @Binding private var starbucksList: [StarbucksFeature]
    @Bindable private var motionManager = MotionManager()
    
    @Namespace var mapScope
    
    init(starbucksList: Binding<[StarbucksFeature]>) {
        self._starbucksList = starbucksList
    }
    
    var body: some View {
        Map(
            position: $viewModel.cameraPosition,
            scope: mapScope,
            content: {
                ForEach(
                    starbucksList.prefix(10),
                    id: \.id,
                    content: { store in
                        let coordinate = CLLocationCoordinate2D(
                            latitude: store.properties.yCoordinate,
                            longitude: store.properties.xCoordinate
                        )
                        
                        Annotation(store.properties.storeName, coordinate: coordinate, content: {
                            Icon.annotation.image
                        })
                    })
                
                if let location = locationManager.currentLocation {
                    Annotation("내 위치", coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "location.north.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .rotationEffect(
                                    .radians(-motionManager.heading)
                                )
                        }
                    }
                }
                        
            })
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
