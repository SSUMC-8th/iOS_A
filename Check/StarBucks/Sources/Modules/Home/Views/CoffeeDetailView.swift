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
            
            menuImageSection(leftAction: {
                container.navigationRouter.pop()
            }, rightAction: {
                // TODO: - 공유 버튼 구현
                print("공유하기")
            })
            
            menuDescriptionSection
            
            temperatureView(menu: menu)
                
            Spacer()
            SBMainButton(title: "주문하기", action: {
                // TODO: - 주문하기 구현
                print("주문하기")
            }, isEnable: true)
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .navigationBarBackButtonHidden(true)
        
        
        
    }
    
    /// 상단 좌우 버튼
    /// - Parameters:
    ///   - leftAction: 네비게이션 back 버튼 탭 시 클로저
    ///   - rightAction: 공유 버튼 탭 시 클로저
    /// - Returns: 상단 좌우 버튼
    private func menuImageSection(leftAction: @escaping () -> Void, rightAction: @escaping () -> Void ) -> some View {
        
        ZStack(alignment: .topLeading) {
            
            menu.image

            HStack {
                Button(action: leftAction, label: {
                    Icon.back.image
                })
                
                Spacer()
                
                Button(action: rightAction, label: {
                    Icon.share.image
                })
            }
            .safeAreaPadding(.vertical, 20)
            .padding(.horizontal, 10)
            
        }
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


