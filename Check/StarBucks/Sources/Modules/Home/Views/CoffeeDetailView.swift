//
//  CoffeeDetailView.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    
    // MARK: - @EnvironmentObject
    @EnvironmentObject var container: DIContainer
    
    // MARK: - Properties
    /// 메뉴
    let menu: Menu
    
    init(container: DIContainer, menu: Menu) {
        self.menu = menu
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            menu.image
                .padding(.bottom, 10)
            
            menuDescriptionSection
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        
        
        
    }
    
    /// 메뉴 설명 섹션
    var menuDescriptionSection: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(menu.koreanName)
                    .font(.mainTextSemiBold24)
                    .foregroundStyle(Color.black03)
                
                Icon.new.image
                
            }
            
            Text(menu.englishName)
                .font(.mainTextSemiBold14)
                .foregroundStyle(Color.gray01)
            
            Text(menu.decription)
                .font(.mainTextSemiBold14)
                .foregroundStyle(Color.gray06)
                .padding(.top, 22)
            
            
            Text(menu.price)
                .font(.mainTextRegular24)
                .foregroundStyle(Color.black)
                .padding(.top, 10)
            
        }
        .padding(.horizontal, 10)
    }
    
}


