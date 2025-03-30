//
//  HomeView.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/29/25.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("nickname") var nickname: String?
    @State private var path = NavigationPath()
    @State private var HomeViewModel: HomeViewModel = .init()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                    TopBanner
                    
                    Spacer().frame(height: 23)
                
                VStack(spacing: 20) {

                    Image("bearAd")
                    
                    RecommendedMenu
                    
                    Image("eventBanner")
                    
                    Image("serviceSuscibe")
                    
                    WhatsNew
                    
                    Banners
                    
                    SweetMenu
                    
                    MoreBanners
                }
                .padding(.horizontal, 10)
            }
            .ignoresSafeArea(.all)
            .navigationDestination(for: CoffeeInfoModel.self) { coffee in
                CoffeeInfoView(coffee: coffee)
            }
        }
    }
    
    private var TopBanner: some View {
        
        VStack {
            ZStack {
                Image("topimg")
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.mainTextBold24)
                    .padding(.top, 120)
                    .padding(.bottom, 34)
                    .padding(.trailing, 99)
                    .padding(.leading, 28)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("11★ until next Reward")
                        .font(.mainTextSemiBold16)
                        .foregroundColor(Color.brown01)

                    ProgressView(value: 0.4)
                        .tint(Color.brown01)
                }
                .frame(maxWidth: 255, maxHeight: 35)
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text("1")
                        .font(.mainTextSemiBold38)
                    Text("/")
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(Color.gray00)
                    Text("12★")
                        .font(.mainTextSemiBold24)
                        .foregroundColor(Color.brown01)
                }
            }
            .padding(.leading, 28)
            .padding(.trailing, 41)
        }
    }
    
    private var RecommendedMenu: some View {
        VStack {
            HStack {
//                Text(nickname.isEmpty ? "(작성한 닉네임)" : "\(nickname)")
                if let myNickname = nickname {
                    Text("\(myNickname)")
                        .font(.mainTextBold24)
                        .foregroundStyle(Color.brown01)
                } else {
                    Text("(작성한 닉네임)")
                        .font(.mainTextBold24)
                        .foregroundStyle(Color.brown01)
                }
                Text("님을 위한 추천 메뉴")
                    .font(.mainTextBold24)
                Spacer()
            }
            
            Spacer().frame(height: 25)
            
            ScrollView (.horizontal, content: {
                LazyHStack(spacing: 16, content: {
                    ForEach(CoffeeInfoModel.allCases, id: \.self, content: { coffee in
                        CircleImageCard(menuName: coffee.CircleImageName())
                            .onTapGesture {
                                path.append(coffee)
                            }
                    })
                })
            })
        }
        .padding(.horizontal, 10)
    }
    
    private func CircleImageCard(menuName: String)-> some View {
        Image(menuName)
            .resizable()
            .frame(width: 130, height: 160)
    }
    
    private var WhatsNew: some View {
        VStack {
            HStack {
                Text("What's New")
                    .font(.mainTextBold24)
                Spacer()
            }
            ScrollView (.horizontal, content: {
                LazyHStack(spacing: 16, content: {
                    ForEach(HomeViewModel.CopyImg, id: \.self, content: { copy in
                        CopyCard(copyName: copy.imageName)
                    })
                })
            })
        }
        .padding(.horizontal, 10)
    }
    
    private func CopyCard(copyName: String) -> some View {
        Image(copyName)
            .resizable()
            .frame(width: 240, height: 249)
    }
    
    private var Banners: some View {
        VStack(spacing: 14) {
            Image("mugcupBanner")
            Image("onlinestoreBanner")
            Image("deliveryBanner")
        }
    }
    
    private var SweetMenu: some View {
        VStack {
            HStack {
                Text("하루가 달콤해지는 디저트")
                    .font(.mainTextSemiBold24)
                Spacer()
            }
            
            Spacer().frame(height: 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(HomeViewModel.DessertImg, id: \.self) { dessert in
                        CircleImageCard(menuName: dessert.imageName)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
    }
    
    private var MoreBanners: some View {
        VStack {
            Image("banner1")
            Image("banner2")
            Image("banner3")
        }
    }
}

#Preview {
    HomeView()
}
