//
//  MapView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 5/1/25.
//

import SwiftUI

struct MapView: View {
    var viewModel: JSONParsingViewModel = .init()
    @State private var searchText: String = ""
    
    @State private var selectedTab: StoreTab = .nearbyStore
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.dismiss) var dismiss
    
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
        }
        
        
        
        
    
}

#Preview {
    MapView()
        .environmentObject(NavigationRouter())
}

