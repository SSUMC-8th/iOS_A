//
//  LoginView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/22/25.
//

import Foundation
import SwiftUI
import Observation

struct LoginView: View {
    
    @State private var id: String = ""
    @State private var pw: String = ""
    @FocusState private var isIdFocused: Bool
    @FocusState private var isPwFocused: Bool
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path:$path){
            VStack {
                mainTitleGroup
                Spacer()
                mainLoginGroup
                Spacer()
                mainBottomGroup
            }
            
            //.border(Color.blue)
            .padding(.top, 104)
        }
    }
    
    private var mainTitleGroup: some View {
        VStack (alignment: .leading, spacing: 28){
            
            
            Image("StarbucksLogo")
                .resizable()
                .frame(width: 97, height:95)
            //.border(Color.red)
            
            Text("안녕하세요.\n스타벅스입니다.")
                .font(.mainTextExtraBold24)
                .kerning(1.2)
            //.border(Color.red)
            
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.mainTextMedium16)
                .foregroundStyle(Color("gray01"))
            //.border(Color.red)
            
            
            
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        //.border(Color.blue)
        .padding(.horizontal, 20)
        
        
    }
    
    
    private var mainLoginGroup: some View {
        VStack (alignment: .leading, spacing: 47) {
            
            VStack(alignment: .leading, spacing: 2){
                TextField("아이디", text: $id)
                    .font(.mainTextRegular13)
                    .focused($isIdFocused)
                
                Divider()
                    .background(isIdFocused ? Color("green01") : Color("gray00"))
                
                Spacer().frame(height:47)
                
                SecureField("비밀번호", text: $pw)
                    .font(.mainTextRegular13)
                    .focused($isPwFocused)
                
                Divider()
                    .background(isPwFocused ? Color("green01") : Color("gray00"))
            }
            .foregroundStyle(.gray)
            
            Button(action: {
                print("로그인 버튼 클릭")
            } , label : {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("green01"))
                        .frame(height:46)
                    
                    Text("로그인하기")
                        .foregroundStyle(Color.white)
                        .font(.mainTextMedium16)
                }
            }
            )
        }
        
        //.border(Color.blue)
        .padding(.horizontal, 20)
        
        
        
    }
    
    private var mainBottomGroup: some View {
        
        VStack (spacing: 19) {
            
            NavigationLink(destination: SignupView()) {
                           Text("이메일로 회원가입하기")
                               .underline()
                               .font(.mainTextRegular12)
                               .foregroundStyle(Color("gray04"))
                       }
                       
                
                Button(action: {
                    
                }) {
                    Image("KakaoLogin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 45)
                }
                
                Button(action: {
                    
                }) {
                    Image("AppleLogin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 45)
                }
                
            }
            //.border(Color.blue)
        }
        
        
    }
    
    


#Preview {
    LoginView()
}
