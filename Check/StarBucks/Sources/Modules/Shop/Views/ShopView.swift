//
//  ShopView.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import SwiftUI

struct ShopView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    // MARK: - @State
    /// 뷰모델
    @State var viewModel: ShopViewModel = .init()
    
    /// Best Items 섹션 페이지
    @State var page: Int = 0
    
    init(container: DIContainer) {
        
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 31) {
                
                onlineStoreSection
                
                allProductsSection
                
                bestItemsSection
                
                newProductsSection
            }
        }
        .background(Color.white01)
    }
    
    /// StarBucks Online Store 섹션
    @ViewBuilder
    private var onlineStoreSection: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
                .foregroundStyle(Color.black)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 28) {
                    ForEach(viewModel.onlineStoreModels, id: \.id) { model in
                        
                        model.image
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        .safeAreaPadding(.horizontal, 16)

    }
    
    /// All Products 섹션
    @ViewBuilder
    private var allProductsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Products")
                .font(.mainTextSemiBold22)
                .foregroundStyle(Color.black03)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17) {
                    ForEach(viewModel.allProductModels, id: \.id) { model in
                        model.image
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        .safeAreaPadding(.horizontal, 16)

    }
    
    /// Best Items 섹션
    @ViewBuilder
    private var bestItemsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Items")
                .font(.mainTextSemiBold22)
                .foregroundStyle(Color.black03)
                .padding(.horizontal, 16)
            
            let chunks = viewModel.bestItemModels.chunked(into: 4)

            TabView(selection: $page) {
                ForEach(
                    Array(
                        chunks.enumerated()
                    ),
                    id: \.offset
                ) { index, items in
                    LazyVGrid(
                        columns: [GridItem(.flexible()), GridItem(.flexible())],
                    ) {
                        ForEach(items, id: \.id) { model in
                            model.image
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 470)
            
            HStack(spacing: 8) {
                ForEach(0..<chunks.count, id: \.self) { index in
                    Circle()
                        .fill(
                            index == page ? Color.black : Color.gray
                                .opacity(0.3)
                        )
                        .frame(width: 8, height: 8)
                        .animation(.easeInOut(duration: 0.2), value: page)
                }
            }
            .frame(maxWidth: .infinity)


        }
        .frame(maxWidth: .infinity)

        
    }
    
    /// New Products 섹션
    @ViewBuilder
    private var newProductsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("New Products")
                .font(.mainTextSemiBold22)
                .foregroundStyle(Color.black03)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17) {
                    ForEach(viewModel.newProductModels, id: \.id) { model in
                        model.image
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        .safeAreaPadding(.horizontal, 16)


    }
    
}

#Preview {
    
    let container = DIContainer()
    ShopView(container: container)
        .environmentObject(container)
}
