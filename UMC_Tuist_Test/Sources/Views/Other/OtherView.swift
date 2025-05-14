//
//  OtherView.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/23/25.
//

import SwiftUI
import Observation

struct OtherView: View {
    //@AppStorage("nickname") var nickname: String = ""
    
    var body: some View {
        let nickname = KeychainWrapper.load(key: "userNickname") ?? "(작성한 닉네임)"
        
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("Other")
                            .font(.mainTextBold24)
                        
                        Spacer()
                        
                        NavigationLink(destination: LoginView()) {
                            Image("logout")
                        }
                    }
                    .background(Color.white)
                    .padding(.horizontal, 24)
                    
                    Spacer().frame(height: 16)
                }
                .frame(maxWidth: 440, maxHeight: 120)
                
                VStack {
                    /*상단 고객 관련 정보 그룹*/
                    VStack {
                        VStack {
                            HStack {
                                Text("\(nickname)")
                                    .foregroundStyle(Color.green01)
                                Text("님")
                            }
                            .font(.mainTextSemiBold24)
                            Text("환영합니다!🙌🏻")
                                .font(.mainTextSemiBold24)
                        }
                        Spacer()
                        
                        HStack {
                            ButtonView(title: "별 히스토리")
                            ButtonView(title: "전자영수증")
                            ButtonView(title: "나만의 메뉴")
                        }
                    }
                    .frame(maxWidth: 440, maxHeight: 209)
                    .padding(.top, 41)
                    
                    Spacer()
                    
                    /*결제*/
                    VStack(spacing: 0) {
                        HStack {
                            Text("Pay")
                                .font(.mainTextRegular18)
                            Spacer()
                        }
                        
                        HStack {
                            ImageAndTextView(title: "스타벅스 카드 등록")
                            Spacer()
                            ImageAndTextView(title: "카드 교환권 등록")
                        }
                        HStack {
                            ImageAndTextView(title: "쿠폰 등록")
                            Spacer()
                            ImageAndTextView(title: "쿠폰 히스토리")
                        }
                    }
                    .frame(maxWidth: 420, maxHeight: 164)
                    .padding(.horizontal)
                    
                    Divider()
                    
                    Spacer()
                    
                    /*고객 지원*/
                    VStack(spacing: 0) {
                        HStack {
                            Text("고객 지원")
                                .font(.mainTextRegular18)
                            Spacer()
                        }
                        .padding(.vertical)
                        
                        HStack {
                            ImageAndTextView(title: "스토어 케어")
                            ImageAndTextView(title: "고객의 소리")
                        }
                        HStack {
                            ImageAndTextView(title: "매장 정보")
                            ImageAndTextView(title: "반납기 정보")
                        }
                        ImageAndTextView(title: "마이 스타벅스 리뷰")
                    }
                    .frame(maxWidth: 420, maxHeight: 164)
                    .padding(.horizontal)
                    .padding(.bottom, 41)
                    Spacer()
                }
                .background(Color.white01)
                .frame(maxWidth: 440)
            }
            .ignoresSafeArea(.all)
        }
    }
    
    private func ButtonView(title: String) -> some View {
        
        NavigationLink(destination: destinationView(for: title)) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .frame(width: 102, height: 108)
                    .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 0)
                
                VStack(spacing: 4) {
                    Image(title)
                        .resizable()
                        .frame(width: 48, height: 48)
                    Text(title)
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(Color.black03)
                }
                .padding(.vertical)
            }
        }
    }
    
    @ViewBuilder
    private func destinationView(for title: String) -> some View {
        switch title {
//        case "별 히스토리":
//            ReceiptView() //임시
        case "전자영수증":
            ReceiptView()
//        case "나만의 메뉴":
//            ReceiptView() //임시
        case "매장 정보":
            StoreInfoView()
        default:
            Text("\(title) 페이지 준비 중 ...")
        }
    }
    
    private func ImageAndTextView(title: String) -> some View {
        //    let title: String
        
        NavigationLink(destination: destinationView(for: title)) {
            HStack {
                Image(title)
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(title)
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(Color.black02)
            }
            Spacer()
        }
        .frame(minWidth: 157)
        .padding(.vertical, 16)
        .padding(.horizontal, 0)
    }
}

#Preview {
    OtherView()
}
