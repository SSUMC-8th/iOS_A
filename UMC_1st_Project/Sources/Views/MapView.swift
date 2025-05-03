//
//  MapView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 5/1/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var jsonviewModel: JSONParsingViewModel = .init()
    @State private var searchText: String = ""
    
    @State private var selectedTab: StoreTab = .nearbyStore
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.dismiss) var dismiss
    
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var mapviewModel: MapViewModel = .init()
    
    
    var body: some View {
        
            VStack{
                HStack{
                    Text("")
                    Spacer()
                    Text("매장 설정")
                    Spacer()
                    Button(action: {dismiss()}, label:{
                        Image("listicon")
                    })
                }
                TextField("검색", text: $searchText)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(13)
                    .font(.caption)
                /*
                HStack {
                    ForEach(Array(StoreTab.allCases.enumerated()), id: \.element) { index, tab in
                        Button {
                            selectedTab = tab
                        } label: {
                            Text(tab.rawValue)
                                .foregroundStyle(selectedTab == tab ? .black : .gray)
                                .font(.footnote)
                        }
                        .frame(width: 75)
                        
                        if index < Tab.allCases.count - 1 {
                            Divider()
                                .frame(height:15)
                                .background(Color.gray.opacity(3))
                        }
                    }
                    Spacer()
                    Text("")
                }*/
            }
            .padding(.horizontal, 20)
            .navigationBarBackButtonHidden(true)
        
        Map(position: $mapviewModel.cameraPosition) {
                    ForEach(mapviewModel.makers, id: \.id, content: { marker in
                        Annotation(marker.title, coordinate: marker.coordinate, content: {
                            Image(systemName: "mappin.circle.fill")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color.red)
                        })
                    })
                }
        
        
        
        }
        
        
        
        
    
}

#Preview {
    MapView()
        .environmentObject(NavigationRouter())
}

