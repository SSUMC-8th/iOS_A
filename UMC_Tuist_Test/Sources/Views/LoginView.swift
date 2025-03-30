//
//  LoginView.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/18/25.
//

import SwiftUI
import Observation

struct LoginView: View {
    @StateObject private var user = LoginViewModel()
    @State private var showMainView = false
    
    enum FocusedField {
        case id, pwd
    }
        
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationStack {
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
            .navigationTitle("")
            .fullScreenCover(isPresented: $showMainView) {
                TabbarView()
            }
        }
        .navigationBarBackButtonHidden()
        .tint(.black)
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
        .frame(alignment: .topLeading)
        
    }

    private var loginButton: some View {
        VStack {
            
            VStack {
                TextField("아이디", text: $user.id)
                    .font(.mainTextRegular13)
                    .focused($focusedField, equals: .id)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    
                Divider()
                    .overlay(focusedField == .id ? Color.green01 : Color.gray00)
                    
            }.frame(maxWidth: 402, maxHeight: 20)
            
            Spacer().frame(height: 47)
        
            VStack {
                TextField("비밀번호", text: $user.pwd)
                    .font(.mainTextRegular13)
                    .focused($focusedField, equals: .pwd)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    
                Divider()
                    .overlay(focusedField == .pwd ? Color.green01 : Color.gray00)
            }.frame(maxWidth: 402, maxHeight: 20)
            
            Spacer().frame(height: 47)
            
            Button(action: {
                if user.login() {
                    showMainView = true
                }else {
                    print("로그인 실패")
                }
            }, label: {
                ZStack {
                    Rectangle()
                        .fill(Color.green01)
                        //.fill(Color("green01")) -> ColorView를 파일이 아닌 View로 선택해서 계속 .green01로 실행이 안됐었음
                        .cornerRadius(20)
                        .frame(height: 46)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                    Text("로그인하기")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.white01)
                }
            })
            
        }
    }

    private var joinButton: some View {
        VStack {
            NavigationLink(destination: SignupView()){
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color.gray04)
                    .underline()
            }
            
            
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
    }
}


#Preview {
    LoginView()
}

