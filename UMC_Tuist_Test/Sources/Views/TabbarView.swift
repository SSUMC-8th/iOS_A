//
//  TabbarView.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/23/25.
//

import SwiftUI

enum Tab {
    case home
    case pay
    case order
    case shop
    case other
}

struct TabbarView: View {
    @State var selectedTab: Tab = .home
    var body: some View {
        VStack {
            Spacer()
            switch selectedTab {
                case .home:
<<<<<<< HEAD
                    HomeView()
=======
                    Text("home")
>>>>>>> 3ac10618351a88174c94584bd41ab7878e819cf5
                case .pay:
                    Text("pay")
                case .order:
                    Text("order")
                case .shop:
                    Text("shop")
                case .other:
<<<<<<< HEAD
                    OtherView()
            }
            CustomTabView(selectedTab: $selectedTab)
                .frame(maxWidth: 440, maxHeight: 71)
        }
        .ignoresSafeArea(.all)
    }
    
=======
                OtherView()
            }
            CustomTabView(selectedTab: $selectedTab)
        }
    }
>>>>>>> 3ac10618351a88174c94584bd41ab7878e819cf5
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                selectedTab = .home
            }, label: {
                Image(selectedTab == .home ? "HomeGreen" : "Home")
            })
            Spacer()
            Button(action: {
                selectedTab = .pay
            }, label: {
                Image(selectedTab == .pay ? "PayGreen" : "Pay")
            })
            Spacer()
            Button(action: {
                selectedTab = .order
            }, label: {
                Image(selectedTab == .order ? "OrderGreen" : "Order")
            })
            Spacer()
            Button(action: {
                selectedTab = .shop
            }, label: {
                Image(selectedTab == .shop ? "ShopGreen" : "Shop")
            })
            Spacer()
            Button(action: {
                selectedTab = .other
            }, label: {
                Image(selectedTab == .other ? "OtherGreen" : "Other")
            })
            Spacer()
        }
<<<<<<< HEAD
        .padding(.vertical, 10)
=======
>>>>>>> 3ac10618351a88174c94584bd41ab7878e819cf5
    }
}

#Preview {
    TabbarView()
}
