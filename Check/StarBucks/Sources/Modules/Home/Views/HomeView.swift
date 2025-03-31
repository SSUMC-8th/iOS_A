//
//  HomeView.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
        
    // MARK: - @State
    /// 뷰모델
    @State var viewModel: HomeViewModel = .init()

    init(container: DIContainer) {
        
    }
    
    // MARK: - Properties
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destinations) {
            
            ScrollView {
                VStack(spacing: 20) {
                    topBannerSection
                    
                    Icon.ad_banner.image
                    
                    recommendMenuSection
                    
                    Icon.event_banner.image
                    
                    Icon.subscribe_banner.image
                    
                    whatsNewSection
                    
                    Icon.mug_banner.image
                    
                    Icon.coldbrew_banner.image
                    
                    Icon.starbucks_banner.image
                }
                .ignoresSafeArea(edges: .vertical)
                
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                    NavigationRoutingView(destination: destination)
                    .environmentObject(container)
            }
            .background(Color.white)
        }
        
    }
    
    /// 탑 배너 섹션
    private var topBannerSection: some View {
        ZStack(alignment: .bottomLeading) {
            Icon.top_banner.image
            VStack(alignment: .leading, spacing: 0) {
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.mainTextBold24)
                    .foregroundStyle(Color.black03)
                HStack {
                    Spacer()
                    Button(action: {print("내용보기")}, label: {
                        HStack {
                            Text("내용 보기")
                                .font(.mainTextRegular13)
                                .foregroundStyle(Color.gray06)
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 8, height: 10)
                                .foregroundStyle(Color.gray06)
                            
                            Spacer().frame(width: 6)

                        }
                    })
                }
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack {
                            Text("\(12 - viewModel.rewardCount)★ until next Reward")
                                .font(.mainTextSemiBold16)
                                .foregroundStyle(Color.brown02)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                            
                        rewardProgress
                    }
                    
                    Spacer()
                    
                    Group {
                        
                        Text("\(viewModel.rewardCount)")
                            .font(.mainTextSemiBold38)
                            .padding(.trailing, 5)
                        Text("/")
                            .font(.mainTextSemiBold24)
                            .foregroundStyle(Color.gray01)
                            .padding(.trailing, 5)

                        Text("12")
                            .font(.mainTextBold24)
                            .foregroundStyle(Color.brown02)
                            .padding(.trailing, 5)
                        Text("★")
                            .font(.mainTextRegular18)
                            .foregroundStyle(Color.brown02)
                            .padding(.top, 6)
                    }
                    
                    Spacer().frame(width: 15)

                    
                    
                }
                
                
            }
            .safeAreaPadding(.horizontal, 28)
            
        }

        
        
    }
    

    /// 탑 배너 게이지
    private var rewardProgress: some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: 260, height: 8)
            .foregroundStyle(Color.gray00)
            .overlay {
                HStack {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: CGFloat(260 * viewModel.rewardCount) / 12)
                        .foregroundStyle(Color.brown02)
                    Spacer()
                }
                
            }
        
    }
    
    /// 추천 메뉴 섹션
    private var recommendMenuSection: some View {
        
        VStack(spacing: 25) {
            
            HStack {
                let attributedString = AttributedString.nickname(nickname: viewModel.userNickname, suffix: " 님을 위한 추천 메뉴", color: Color.brown02).attributedString
                
                Text(attributedString)
                    .font(.mainTextBold24)
                
                Spacer()
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.recommendModel, id: \.id) {
                        item in
                        item.menu.thumnNailImage
                            .onTapGesture {
                                print("gd")
                                container.navigationRouter.push(to: .coffeeDetailView(menu: item.menu)
                                )
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .safeAreaPadding(.horizontal, 10)

        }
        .safeAreaPadding(.horizontal, 10)
    }
    
    private var whatsNewSection: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text("What's\nNew")
                    .font(.mainTextBold24)
                    .foregroundStyle(Color.black03)
                
                Spacer()
            }
            .padding(.top, 5)
            
            ScrollView(.horizontal) {
                
                LazyHStack(spacing: 10) {
                    ForEach(viewModel.whatsNewModel, id: \.id) {
                        item in
                        card(for: item)
                        
                    }
                }
                
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 10)
    }
    
    private func card(for item: WhatsNewModel) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            item.image
            
            Text(item.title)
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color.black02)
            
            Text(item.decription)
                .font(.mainTextSemiBold13)
                .foregroundStyle(Color.gray03)
            
            Spacer()
        }
        .frame(width: 242, height: 250)
        
    }
}


