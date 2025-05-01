//
//  OrderView.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import SwiftUI

struct OrderView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    @Bindable var viewModel: OrderViewModel = .init()
    
    @State var selectedSegment: OrderSegmentCase = .all
    @State var selectedCategory: OrderCategoryCase = .beverage
    @State var showSheet: Bool = false
    
    init(container: DIContainer) {
        
    }
    
    var body: some View {
        VStack(spacing: 0) {
            navigationBar
            
            ZStack(alignment: .bottom) {
                
                HStack {
                    OrderSegmentControl<OrderSegmentCase>(
                        selectedSegment: $selectedSegment
                    )
                    
                    Spacer()
                }
                
                Divider()
                    .foregroundStyle(Color.gray00)
                    .frame(maxWidth: .infinity)
                
            }
            
            categoryControl()
            
            Divider()
                .frame(maxWidth: .infinity)
            
            ZStack(alignment: .bottom) {
                scrollView
                
                sheetButton
            }
            
        }
        .sheet(isPresented: $showSheet, content: {
            StoreSelectView()
        })
    }
    
    private var navigationBar: some View {
        HStack {
            Text("Order")
                .font(.mainTextBold24)
                .foregroundStyle(Color.black03)
            
            Spacer()
        }
        .padding(.bottom, 30)
        .padding(.horizontal, 23)
    }
    
    private func categoryControl() -> some View {
        HStack(spacing: 10) {
            
            ForEach(OrderCategoryCase.allCases, id: \.self) { category in
                makeCategoryButton(category)
            }
            
            Spacer()
        }
        .padding(.top, 30)
        .padding(.bottom, 12)
        .padding(.horizontal, 23)
    }

    private func makeCategoryButton(_ category: OrderCategoryCase) -> some View {
        Button(action: {
            selectedCategory = category
        }) {
            HStack(spacing: 3) {
                Text(category.title)
                    .font(.mainTextSemiBold16)
                    .foregroundColor(
                        selectedCategory == category ? .black01 : .gray04
                    )

                Icon.new.image
            }
        }
    }
    
    private var scrollView: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 26) {
                ForEach(viewModel.menuModel, id: \.id) {
                    item in
                    menuItem(menu: item.menu)
                        .onTapGesture {
                            print("추천 커피 메뉴")
                            container.navigationRouter.push(to: .coffeeDetailView(menu: item.menu)
                            )
                        }
                }
            }
        }
        .contentMargins(.top, 20)
        .frame(maxWidth: .infinity)
        .scrollIndicators(.hidden)
    }
    
    private func menuItem(menu: Menu) -> some View {
        HStack(spacing: 16) {
            menu.orderImage
                .resizable()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(menu.koreanName)
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(Color.gray06)
                    
                
                Text(menu.englishName)
                    .font(.mainTextSemiBold13)
                    .foregroundStyle(Color.gray03)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 23)
    }
    
    private var sheetButton: some View {
        VStack {
            HStack {
                
                Text("주문할 매장을 선택해 주세요")
                    .foregroundStyle(.white)
                    .font(.mainTextSemiBold16)
                
                Spacer()
                
                Button(action: {
                    showSheet.toggle()
                    print("zz")

                }, label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 14, height: 7)
                        .foregroundStyle(.white)
                    
                })
            }
            .padding(.horizontal, 20)
            
            Rectangle()
                .fill(Color.gray04)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(
            Color.black
        )
    }
}

