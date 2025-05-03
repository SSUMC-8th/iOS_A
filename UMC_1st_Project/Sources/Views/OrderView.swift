//
//  OrderView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/29/25.
//

import SwiftUI

enum TopTab: String, CaseIterable {
    case allMenu = "전체 메뉴"
    case myMenu = "나만의 메뉴"
    case cakeReservation = "홀케이크 예약"
}

enum BottomTab: String, CaseIterable {
    case drink = "음료"
    case food = "푸드"
    case product = "상품"
}

struct OrderView: View {
    
    @State private var selectedTopTab: TopTab = .allMenu
    @State private var selectedBottomTab: BottomTab = .drink
    @State private var showStoreSheet = false
    
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            HStack {
                Text("Order")
                    .font(.mainTextBold24)
                Spacer()
                Text("")
            }
            .padding(20)
            TopSegmentView(selectedTab: $selectedTopTab)
            BottomSegmentView(selectedTab: $selectedBottomTab)
            
            
            Divider()
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(coffeeMenus, id: \.name) { item in
                        OrderListView(item: item)
                    }
                }
                .padding()
            }
            
            
            Button(action: {
                showStoreSheet.toggle()
            }) {
                VStack{
                    HStack {
                        Text("주문할 매장을 선택해 주세요")
                            .font(.mainTextSemiBold16)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    Divider()
                        .background(Color.gray.opacity(3))
                }
                .padding()
                .background(Color.black.opacity(0.9))
                .foregroundStyle(.white)
            }
            /*.sheet(isPresented: $showStoreSheet) {
                StoreView()
            }*/
            
            
            .edgesIgnoringSafeArea(.bottom)
        }
       
        .sheet(isPresented: $showStoreSheet) {
           StoreView()
                .environmentObject(router)
            //Text("테스트용")
        }
                    
    }
    
    
    
    struct TopSegmentView: View {
        @Binding var selectedTab: TopTab
        @Namespace private var animation

        var body: some View {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ForEach(TopTab.allCases, id: \.self) { tab in
                        Button {
                            withAnimation(.easeInOut) {
                                selectedTab = tab
                            }
                        } label: {
                            VStack(spacing: 12) {
                                if tab == .cakeReservation {
                                        HStack(spacing: 4) {
                                            Image("홀케이크 예약")
                                            Text(tab.rawValue)
                                            
                                        }
                                        .foregroundStyle(selectedTab == tab ? .black : .gray)
                                        .font(.mainTextSemiBold16)
                                    } else {
                                       
                                        Text(tab.rawValue)
                                            .foregroundStyle(selectedTab == tab ? .black : .gray)
                                            .font(.mainTextSemiBold16)
                                    }
                                ZStack {
                                    Divider()
                                        .background(Color.gray.opacity(3))
                                        .shadow(color: .black.opacity(0.1), radius: 3, y: 2)
                                    
                                    if selectedTab == tab {
                                        Capsule()
                                            .fill(Color("green01"))
                                            .frame(height: 3)
                                            .matchedGeometryEffect(id: "underline", in: animation)
                                    } else {
                                        Spacer().frame(height: 3)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.vertical, 12)

            
            }
        }
    }

    
    struct BottomSegmentView: View {
        @Binding var selectedTab: BottomTab

        var body: some View {
            HStack {
                ForEach(BottomTab.allCases, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        Text(tab.rawValue)
                            .foregroundStyle(selectedTab == tab ? .black : .gray)
                            .font(.mainTextSemiBold16)
                        Image("new")
                    }
                    .frame(width: 70)
                }
                Spacer()
                Text("")
            }
            .padding(.horizontal, 10)
        }
    }
    
    struct OrderListView: View {
        let item: CoffeeMenu
        var body: some View {
            
            LazyVStack {
                HStack (spacing : 16){
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.mainTextSemiBold16)
                        Text(item.description)
                            .font(.mainTextSemiBold13)
                            .foregroundStyle(Color("gray03"))
                    }
                    Spacer()
                }
                
            }
        }
    }
    
    
    
    
    
}

#Preview {
    OrderView()
        .environmentObject(NavigationRouter())
}
