//
//  OtherView.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        
        VStack(spacing: 24) {
            navigationBar
                                   
            nicknameSection
            
            tileSection
            
            paySection
            
            customerSection
            
            Spacer()
        }
        .background(Color.white01)
    }
    
    private var navigationBar : some View {
        ZStack(alignment: .bottom) {
            
            HStack(spacing: 0) {
                Text("Other")
                    .font(.mainTextBold24)
                
                Spacer()
            
                Icon.logout.image
            }
            .padding(.horizontal, 19)
        }
        .frame(height: 80)
        .background(Color.white)
    }
    
    private var nicknameSection: some View {
        VStack(spacing: 5) {
            
            let attributedString = AttributedString.nickname(nickname: "체크").attributedString
            
            Text(attributedString)
                .font(.mainTextSemiBold24)
            
            Text("환영합니다! 🙌🏻")
                .font(.mainTextSemiBold24)
        }
    }
    
    private var tileSection: some View {
        HStack(spacing: 10) {
            makeTileButton(title: "별 히스토리", image: Icon.star.image)
            makeTileButton(title: "전자영수증", image: Icon.receipt.image)
            makeTileButton(title: "나만의 메뉴", image: Icon.own_menu.image)
        }
    }
    
    private var paySection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Pay")
                .font(.mainTextSemiBold18)
            
            VStack(spacing: 30) {
                
                HStack {
                    PayCard(title: "스타벅스 카드 등록", image: Icon.starbucks_card.image, action: {print("스타벅스 카드 등록")})
                    
                    Spacer()
                    
                    PayCard(title: "카드 교환권 등록", image: Icon.card_change.image, action: {print("카드 교환권 등록")})

                }

                HStack {
                    PayCard(title: "쿠폰 등록", image: Icon.coupon.image, action: {print("쿠폰 등록")})

                    Spacer()

                    PayCard(title: "쿠폰 히스토리 등록", image: Icon.coupon_history.image, action: {print("쿠폰 히스토리")})
                }

            }
            
            Divider()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .foregroundStyle(Color.black01)
                .padding(.bottom, 20)
        }
        .padding(.horizontal, 19)
    }
    
    private var customerSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
            
            VStack(spacing: 30) {
                
                HStack {
                    PayCard(title: "스토어 케어", image: Icon.store_care.image, action: {print("스토어 케어")})
                    
                    Spacer()

                    PayCard(title: "고객의 소리", image: Icon.customer.image, action: {print("고객의 소리")})

                }
                HStack {
                    PayCard(title: "매장 정보", image: Icon.store_info.image, action: {print("매장 정보")})
                    Spacer()

                    PayCard(title: "반납기 정보", image: Icon.return_info.image, action: {print("반납기 정보")})
                }
                
                HStack {
                    PayCard(title: "마이 스타벅스 리뷰", image: Icon.my_review.image, action: {print("마이 스타벅스 리뷰")})
                    
                    Spacer()
                }

            }
        }
        .padding(.horizontal, 19)

    }
    
    private func makeTileButton(title: String, image: Image) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
            
            VStack(spacing: 7) {
                image
                
                Text(title)
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(Color.black03)
            }
        }
        .frame(width: 102, height: 108)
    }
}

#Preview {
    OtherView()
}


