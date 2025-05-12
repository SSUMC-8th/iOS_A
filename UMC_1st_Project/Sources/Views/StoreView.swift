//
//  StoreView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/30/25.
//

import SwiftUI

enum StoreTab: String, CaseIterable {
    case nearbyStore = "가까운 매장"
    case oftenVisitedStore = "자주 가는 매장"
}

struct StoreView: View {
    
    @EnvironmentObject var router: NavigationRouter
    var viewModel: JSONParsingViewModel = .init()
    @State private var searchText: String = ""
    @State private var selectedTab: StoreTab = .nearbyStore
    
    var body: some View {
        NavigationStack(path: $router.path){
            VStack{
                HStack{
                    Text("")
                    Spacer()
                    Text("매장 설정")
                        .font(.mainTextMedium16)
                    Spacer()
                    Button(action: {router.path.append("map")}, label:{
                        Image("mapicon")
                    })
                }
                .navigationDestination(for: String.self) { value in
                                    if value == "map" {
                                        MapView()
                                    }
                                }
                
                TextField("검색", text: $searchText)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(13)
                    .font(.mainTextSemiBold13)
                
                HStack {
                    ForEach(Array(StoreTab.allCases.enumerated()), id: \.element) { index, tab in
                        Button {
                            selectedTab = tab
                        } label: {
                            Text(tab.rawValue)
                                .foregroundStyle(selectedTab == tab ? .black : .gray)
                                .font(.mainTextRegular13)
                        }
                        .frame(width: 75)
                        
                        if index < StoreTab.allCases.count - 1 {
                            Divider()
                                .frame(height:15)
                                .background(Color.gray.opacity(3))
                        }
                    }
                    Spacer()
                    Text("")
                }
            }
            .padding(.horizontal, 20)
        }
        
        
        
        
    }
}

#Preview {
    StoreView()
        .environmentObject(NavigationRouter())
    
}

