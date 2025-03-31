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
            
            temperatureView(menu: menu)
                
            Spacer()
            SBMainButton(title: "주문하기", action: {
                // TODO: - 주문하기 구현
            }, isEnable: true)
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .navigationBarBackButtonHidden(true)
        
        
        
    }
    
    /// 메뉴 설명 섹션
    private var menuDescriptionSection: some View {
        
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
    
    @ViewBuilder
    private func temperatureView(menu: Menu) -> some View {
        switch menu.temperature {
        case .hot:
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color.gray00)
                        
                RoundedRectangle(cornerRadius: 20)
                    
            }
            .frame(maxWidth: .infinity)
            .frame(height: 36)
        case .ice:
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color.gray00)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 36)
        default:
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.clear)
                    .stroke(Color.gray00)
                
                Text(menu.temperature.rawValue)
                    .font(.mainTextBold15)
                    .foregroundStyle(menu.temperature == .hotOnly ? .red : .blue)
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
            .frame(height: 36)
        }
    }
    
}


