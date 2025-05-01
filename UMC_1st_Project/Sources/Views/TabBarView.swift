//
//  TabBarView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/24/25.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selection: Int
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        
        TabView (selection: $selection){
            
            
            Tab("Home", image: selection == 0 ? "SelectedHome" : "Home", value: 0) {
                HomeView()
            }
            Tab("Pay", image: selection == 1 ? "SelectedPay" : "Pay", value: 1) {
                Text("Pay")
            }
            Tab("Order", image: selection == 2 ? "SelectedOrder" : "Order", value: 2) {
                OrderView()
            }
            Tab("Shop", image: selection == 3 ? "SelectedShop" : "Shop", value: 3) {
                ShopView()
            }
            Tab("Other", image: selection == 4 ? "SelectedOther" : "Other", value: 4) {
                OtherView()
                    .environmentObject(router)
            }
            
            
            
        }
        .tint(Color("green02"))
        .toolbar(.hidden, for: .navigationBar)
        //.foregroundStyle(Color.white)
        
       
        
    }
    
}

struct TabBarView_PreviewWrapper: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabBarView(selection: $selectedTab)
    }
}

#Preview {
    TabBarView_PreviewWrapper()
        .environmentObject(NavigationRouter())
}

