//
//  ShopView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/8/25.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ScrollView{
            VStack (spacing : 35){
                onlineStore
                
                allProducts
                
                bestItems()
                
                NewProducts()
            }
            .padding(.horizontal, 15)
            
        }
        
        .background(Color("white01"))
        
        
        
    }
    
    private var onlineStore : some View{
        VStack (alignment: .leading){
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
            
            ScrollView(.horizontal) {
                LazyHStack (spacing : 28){
                    Image("OnlineStore_1")
                    Image("OnlineStore_2")
                    Image("OnlineStore_3")
                }
            }
        }
    }
    
    private var allProducts : some View {
        VStack (alignment: .leading){
            Text("All Products")
                .font(.mainTextSemiBold22)
            ScrollView(.horizontal) {
                LazyHStack (spacing : 17){
                    ProductCard(title: "텀블러", image: "all_tumbler")
                    ProductCard(title: "커피 용품", image: "all_coffeeproducts")
                    ProductCard(title: "선물세트", image: "all_present")
                    ProductCard(title: "보온병", image: "all_thermos")
                    ProductCard(title: "머그/컵", image: "all_mugcup")
                    ProductCard(title: "라이프스타일", image: "all_lifestyle")
                    
                }
            }
        }
    }
    

    }
    
    
struct bestItems: View {
    @State private var selectedPage = 0
    private let pages = ShopModel.bestItemPages
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Best Items")
                .font(.mainTextSemiBold22)
            
            TabView(selection: $selectedPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    LazyVGrid(columns: columns, spacing: 40) {
                        ForEach(pages[index], id: \.self) { product in
                            VStack(alignment: .leading, spacing: 10) {
                                Image(product.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            
                                Text(product.name)
                                    .font(.mainTextSemiBold13)
                                    .foregroundStyle(Color("black02"))
                            }
                            .frame(width: 157, height: 208)
                            //.border(Color.black)
                        }
                    }
                    .tag(index)
                }
            }
            //.border(Color.black)
            .tabViewStyle(.page)
            .frame(maxWidth: .infinity, minHeight: 470, maxHeight: 470, alignment: .top)
           
          
        }
    }
}


struct NewProducts: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    private let products = ShopModel.newProducts
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("New Products")
                .font(.mainTextSemiBold22)
            
            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(products, id: \.self) { product in
                    VStack(alignment: .leading, spacing: 10) {
                        Image(product.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text(product.name)
                            .font(.mainTextSemiBold14)
                            .foregroundStyle(Color("black02"))
                    }
                    .frame(width: 157, height: 208)
                    
                }
            }
        }
    }
}

    
    
struct ProductCard : View {
    var title: String
    var image: String
    var body: some View {
        VStack (spacing:10) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .foregroundStyle(Color("black02"))
                .font(.mainTextSemiBold13)
            
        }
        .frame(width: 80, height: 108)
    }
    
    
}
    
    
    
    #Preview {
        ShopView()
        
    }

