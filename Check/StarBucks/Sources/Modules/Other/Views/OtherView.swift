//
//  OtherView.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import SwiftUI

struct OtherView: View {
    
    // MARK: - @AppStorage
    /// 닉네임
    @AppStorage("userNickname") private var userNickname = ""
    
    var body: some View {
        
        VStack(spacing: 24) {
            navigationBar
                                   
            nicknameSection
            
            tileButtonSection
            
            paySection
            
            customerSection
            
            Spacer()
        }
        .background(Color.white01)
    }
    
    /// 네비게이션 바
    private var navigationBar : some View {
        ZStack(alignment: .bottom) {
            
            HStack(spacing: 0) {
                Text("Other")
                    .font(.mainTextBold24)
                
                Spacer()
            
                // TODO: - 로그아웃
                Button(action: {print("로그아웃")}, label: {
                    Icon.logout.image
                })
            }
            .padding(.horizontal, 19)
        }
        .frame(height: 80)
        .background(Color.white)
    }
    
    /// XXX 님 환영합니다! 섹션
    private var nicknameSection: some View {
        VStack(spacing: 5) {
            
            let attributedString = AttributedString.nickname(nickname: userNickname.isEmpty ? "(작성한 닉네임)" : userNickname).attributedString
            
            Text(attributedString)
                .font(.mainTextSemiBold24)
            
            Text("환영합니다! 🙌🏻")
                .font(.mainTextSemiBold24)
        }
    }
    
    /// 타일 버튼 섹션
    private var tileButtonSection: some View {
        HStack(spacing: 10) {
            
            // TODO: - 타일 버튼 탭 이벤트 구현
            makeTileButton(title: "별 히스토리", image: Icon.star.image, action: {print("별 히스토리")})
            makeTileButton(title: "전자영수증", image: Icon.receipt.image, action: {print("전자영수증")})
            makeTileButton(title: "나만의 메뉴", image: Icon.own_menu.image, action: {print("나만의 메뉴")})
        }
    }
    
    /// Pay 버튼 섹션
    private var paySection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Pay")
                .font(.mainTextSemiBold18)
            
            // TODO: - 메뉴 버튼 탭 이벤트 구현
            VStack(spacing: 30) {
                
                HStack {
                    OtherMenuCard(title: "스타벅스 카드 등록", image: Icon.starbucks_card.image, action: {print("스타벅스 카드 등록")})
                    
                    Spacer()
                    
                    OtherMenuCard(title: "카드 교환권 등록", image: Icon.card_change.image, action: {print("카드 교환권 등록")})

                }

                HStack {
                    OtherMenuCard(title: "쿠폰 등록", image: Icon.coupon.image, action: {print("쿠폰 등록")})

                    Spacer()

                    OtherMenuCard(title: "쿠폰 히스토리 등록", image: Icon.coupon_history.image, action: {print("쿠폰 히스토리")})
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
    
    /// 고객지원 버튼 섹션
    private var customerSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
            
            VStack(spacing: 30) {
                
                // TODO: - 메뉴 버튼 탭 이벤트 구현
                HStack {
                    OtherMenuCard(title: "스토어 케어", image: Icon.store_care.image, action: {print("스토어 케어")})
                    
                    Spacer()

                    OtherMenuCard(title: "고객의 소리", image: Icon.customer.image, action: {print("고객의 소리")})

                }
                HStack {
                    OtherMenuCard(title: "매장 정보", image: Icon.store_info.image, action: {print("매장 정보")})
                    Spacer()

                    OtherMenuCard(title: "반납기 정보", image: Icon.return_info.image, action: {print("반납기 정보")})
                }
                
                HStack {
                    OtherMenuCard(title: "마이 스타벅스 리뷰", image: Icon.my_review.image, action: {print("마이 스타벅스 리뷰")})
                    
                    Spacer()
                }

            }
        }
        .padding(.horizontal, 19)

    }
    
    /// 타일 버튼을 생성합니다
    /// - Parameters:
    ///   - title: 타일 버튼의 제목
    ///   - image: 타일 버튼의 이미지
    ///   - action: 타일 버튼이 탭 됐을 때 실행
    /// - Returns: 타일 버튼을 리턴
    private func makeTileButton(title: String, image: Image, action: @escaping () -> Void) -> some View {
        Button(action: { action() }, label: {
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
            
        })
    }
}

#Preview {
    OtherView()
}


