//
//  SBTabView.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import SwiftUI

struct SBTabView: View {
    
    // MARK: - @State
    /// 현재 탭
    @State private var selectedTab: SBTabCase = .home
    
    var body: some View {
        ZStack {
            selectedTab.contentView
                    
            VStack {
                Spacer()
                        
                tabBar
            }
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)

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
    SBTabView()
}
