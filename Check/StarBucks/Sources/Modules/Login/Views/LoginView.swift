//
//  LoginView.swift
//  StarBucks
//
//  Created by LEE on 3/17/25.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        VStack(spacing: 50) {
            
            titleSection
            
            loginSection
            
            oAuthSection
        }
    }
    
    private var titleSection: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 28) {
                
                Icon.starbucks.image
                    .resizable()
                    .frame(width: 97, height: 95)
                
                VStack(alignment: .leading, spacing: 19) {
                    
                    Text("안녕하세요.\n스타벅스입니다.")
                        .font(.mainTextExtraBold24)
                    
                    Text("회원 서비스 이용을 위해 로그인 해주세요.")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.gray01)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .safeAreaPadding(.horizontal, 19)
        
    }
    
    private var loginSection: some View {
        
        VStack(spacing: 47) {
            VStack(alignment: .leading, spacing: 2) {
                Text("아이디")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color.black01)
                Divider()
                    .foregroundStyle(Color.gray00)
                    .frame(height: 0.7)
            }
            
            VStack(alignment: .leading, spacing: 2){
                Text("비밀번호")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color.black01)
                Divider()
                    .foregroundStyle(Color.gray00)
                    .frame(height: 0.7)
            }
            
            Button(action: { print("로그인 버튼 누름!") }, label: {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green01)
                    
                    Text("로그인하기")
                        .font(.mainTextMedium16)
                        .foregroundStyle(.white)
                }
                .frame(height: 46)
            })
        }
        .safeAreaPadding(.horizontal, 19)
    }
    
    private var oAuthSection: some View {
        
        VStack(alignment: .center, spacing: 19) {
            
            Button(action: { print("이메일로 회원가입하기 버튼 누름!")}, label: {
                Text("이매일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color.gray04)
                    .underline(true, color: .gray04)
            })
            
            Button(action: { print("카카오 로그인") }, label: {
                Icon.kakao_login.image

            })
                
            Button(action: { print("카카오 로그인") }, label: {
                Icon.apple_login.image
            })
            
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice("iPhone 11")
                .previewDisplayName("iPhone 11")
            
            LoginView()
                .previewDevice("iPhone 16 Pro Max")
                .previewDisplayName("iPhone 16 Pro Max")
        }
    }
}
