//
//  SBTabView.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import SwiftUI

struct SBTabView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    // MARK: - @State
    /// 현재 탭
    @State private var selectedTab: SBTabCase = .home
    
    // MARK: - Properties
    /// 팝업 광고 나타났었는가
    @AppStorage("didPopup") private var didPopup = false
    
    init(container: DIContainer) {
        
    }
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destinations) {
            
            VStack {
                switch selectedTab {
                case .home:
                    if didPopup {
                        HomeView(container: container)
                            .environmentObject(container)
                    } else {
                        AdPopUpView()
                    }
                case .pay:
                    PayView(container: container)
                        .environmentObject(container)
                case .order:
                    OrderView(container: container)
                        .environmentObject(container)
                case .shop:
                    ShopView(container: container)
                        .environmentObject(container)
                case .other:
                    OtherView(container: container)
                        .environmentObject(container)
                }
                
                Spacer()
                
                tabBar
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                    NavigationRoutingView(destination: destination)
                    .environmentObject(container)
            }
            .background(Color.white)
            .navigationBarBackButtonHidden(true)
        }
        
    }
    
    /// 탭 바
    private var tabBar: some View {
        
        HStack(alignment: .bottom) {
            ForEach(SBTabCase.allCases, id: \.rawValue) { tab in
                Spacer()
                    
                Button(action: {
                    selectedTab = tab
                }) {
                    VStack {
                        
                        Image(
                            selectedTab == tab ? tab.selectedImageName : tab.imageName
                        )
                        .padding(.top, 20)
                    }
                    
                }
                    
                Spacer()
            }
        }
        .frame(height: 70)
        .background(.white)
        
    }
}

#Preview {
    let container = DIContainer()
    SBTabView(container: container)
        .environmentObject(container)
}




