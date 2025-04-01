//
//  LoginView.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/18/25.
//

import SwiftUI

struct LoginView: View {
    @State private var user = LoginModel()
    
    var body: some View {
        VStack {
            VStack (spacing: 0){
                mainTitle
                    .frame(maxWidth: 402, maxHeight: 219, alignment: .topLeading)
                
                Spacer()
                
                loginButton
                    .frame(maxWidth: 402, maxHeight: 180, alignment: .center)
                
                Spacer()/*.frame(minWidth: 0, maxWidth: .infinity)*/
                
                joinButton
                    .frame(maxWidth: 306, maxHeight: 144, alignment: .bottom)
            }
        }
        .padding(.top, 104)
        .padding()
    }

    
    private var mainTitle: some View {
        VStack (alignment: .leading, spacing: 0){
            Image(.starbucsLogo)
                .resizable()
                .frame(width: 97, height: 95)
            
            Spacer()
            
            Text("안녕하세요.\n스타벅스입니다.")
                .font(.mainTextExtraBold24)
                .kerning(1.2)
            
            Spacer().frame(height: 19)
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.mainTextMedium16)
                .foregroundStyle(Color.gray01)
        }
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .frame(alignment: .topLeading)
        
    }

    private var loginButton: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("아이디")
                    .font(.mainTextRegular13)
                Divider()
                    .overlay(Color.gray)
            }.shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            
            Spacer().frame(height: 47)
        
            VStack(alignment: .leading) {
                Text("비밀번호")
                    .font(.mainTextRegular13)
                Divider()
                    .overlay(Color.gray)
            }.shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            
            Spacer().frame(height: 47)
            
            Button(action: {
                print("Hello")
            }, label: {
                ZStack {
                    Rectangle()
                        .fill(Color.green01)
                        //.fill(Color("green01")) -> ColorView를 파일이 아닌 View로 선택해서 계속 .green01로 실행이 안됐었음
                        .cornerRadius(20)
                        .frame(height: 46)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    Text("로그인하기")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.white01)
                }
            })
            
        }
    }

    private var joinButton: some View {
        VStack {
            Button(action: {
                print("Hello")
            }, label: {
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color.gray04)
                    .underline()
            })
            
            Spacer().frame(height: 19)
            
            Button(action: {
                print("Hello")
            }, label: {
                Image(.kakaoLogin)
                    .resizable()
                    .frame(width: 301, height: 45)

            })
            
            Spacer().frame(height: 19)
            
            Button(action: {
                print("Hello")
            }, label: {
                Image(.appleLogin)
                    .resizable()
                    .frame(width: 301, height: 45)
            })
        }
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
    }
}


#Preview {
    LoginView()
}

