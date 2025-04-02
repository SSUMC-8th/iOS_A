//
//  HomeView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/30/25.
//

import SwiftUI
import Foundation
import Observation

struct HomeView: View {
    
    @AppStorage("nickName") private var nickName: String?
    @State private var HomeViewModel : HomeViewModel = .init()
    
   // @State private var path = NavigationPath()
    @StateObject private var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path){
            ScrollView {
                
                topbanner
                Spacer().frame(height:23)
                VStack (spacing : 20){
                    Image("icechallengebanner")
                        .resizable()
                        .scaledToFit()
                    
                    recommendedMenu
                    
                    
                    Image("bloomingbanner")
                        .resizable()
                        .scaledToFit()
                    Image("servicebanner")
                        .resizable()
                        .scaledToFit()
                    
                    WhatsNew
                    
                    Image("mugcupbanner")
                        .resizable()
                        .scaledToFit()
                    Image("onlinestorebanner")
                        .resizable()
                        .scaledToFit()
                    Image("deliverysvcbanner")
                        .resizable()
                        .scaledToFit()
                    
                    dessertMenu
                    
                    Image("coldbrewbanner")
                        .resizable()
                        .scaledToFit()
                    Image("beveragebanner")
                        .resizable()
                        .scaledToFit()
                    Image("smileclubbanner")
                        .resizable()
                        .scaledToFit()
                    
                }
                .padding(.horizontal, 15)
            }
            .ignoresSafeArea()
            .navigationDestination(for: CoffeeType.self) { coffee in
                            CoffeeDetailsView(coffeeType: coffee)
                        }
            
        }
        .environmentObject(router)
        
    }
    
    private var topbanner : some View {
        VStack{
            ZStack (alignment: .bottomLeading){
                Image("topbanner")
                
                VStack (alignment: .leading, spacing : 18){
                    Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                        .font(.mainTextBold24)
                        .lineSpacing(5)
                    //.border(Color.black)
                    
                    HStack {
                        Spacer()
                        Text("내용 보기")
                            .font(.mainTextRegular13)
                            .foregroundStyle(Color("gray06"))
                        Image("내용 보기 버튼")
                        
                    }
                    //.border(Color.blue)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 5)
            }
            //.border(Color.red)
            
            HStack {
                
                VStack (alignment: .leading, spacing: 5){
                    Text("11★ until next Reward")
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(Color("brown02"))
                    //.frame(width: 255)
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 8)
                            
                            Rectangle()
                                .fill(Color("brown01"))
                                .frame(width: geometry.size.width * 0.4, height: 8)
                            
                        }
                        .cornerRadius(5)
                    }
                    .frame(width:255)
                    
                    
                }//.border(Color.blue)
                
                Spacer()
                
                HStack (alignment : .center, spacing: 5){
                    Text("1")
                        .font(.mainTextSemiBold38)
                    Text("/")
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(Color.gray)
                    Text("12★")
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(Color("brown02"))
                    
                }
                .padding(0)
                
            }
            .padding(.horizontal, 30)
            .frame(height : 35)
            //.border(Color.black)
            
            Spacer().frame(height:23)
            
            
            
            
            
        }
        
    }
    
    
    private var recommendedMenu : some View {
        
        VStack (alignment: .leading){
            HStack {
                Text("\(nickName ?? "(설정 닉네임)")")
                    .foregroundColor(Color("brown02"))
                    .font(.mainTextSemiBold24)
                Text("님을 위한 추천 메뉴")
                    .font(.mainTextSemiBold24)
                
            } .padding(.horizontal, 10)
            ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(HomeViewModel.coffees) { coffee in
                                Button(action: {
                                    if let type = coffee.coffeeType {
                                        router.navigateToCoffeeDetails(coffee: type)
                                    }
                                }) {
                                    CircleImageCard(menu: coffee)
                                }
                            }
                        }
               .padding(.horizontal, 10)
                
            }
        }
    }
    
    
    private var WhatsNew : some View {
        VStack(alignment: .leading) {
            
            Text("What's \nNew")
                .font(.mainTextSemiBold24)
            
            ScrollView(.horizontal) {
                LazyHStack (spacing : 16) {
                    ForEach(HomeViewModel.whatsnews) { card in
                        WhatsNewCard(card: card)
                    }
                }
            }
        }
    }
    
    private var dessertMenu : some View {
        
        VStack (alignment: .leading){
            VStack{
                Text("하루가 달콤해지는 디저트")
                    .font(.mainTextSemiBold24)
            }.padding(.horizontal, 10)
            ScrollView(.horizontal) {
                LazyHStack (spacing : 16) {
                    ForEach(HomeViewModel.dessert) { dessert in
                        CircleImageCard(menu: dessert)
                    }
                }
                .padding(.horizontal, 10)
                
            }
        }
    }
    
    
    
    struct CircleImageCard: View {
        let menu : Menu
        
        var body: some View {
            VStack {
                Image(menu.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                
                Text(menu.imageName)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color.black)
                
            }
        }
    }
    
    struct WhatsNewCard: View {
        let card : Menu
        
        var body: some View {
            VStack {
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 249)
                
            }
        }
    }
}



#Preview {
    HomeView()
}
