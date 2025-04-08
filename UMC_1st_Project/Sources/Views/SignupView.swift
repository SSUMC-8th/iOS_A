//
//  SignupView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/24/25.
//

import SwiftUI
import Foundation

struct SignupView: View {
    
    @StateObject private var signupViewModel = SignupViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationBarView()
        
        VStack {
            TextField("닉네임", text: $signupViewModel.nickName)
                .font(.mainTextRegular18)
            
            Divider()
            
            Spacer().frame(height:49)
            
            TextField("이메일", text: $signupViewModel.email)
                .font(.mainTextRegular18)
            
            Divider()
            Spacer().frame(height:49)
            
            TextField("비밀번호", text: $signupViewModel.password)
                .font(.mainTextRegular18)
            
            Divider()
            
            Spacer()
            
            Button(action: {
                if isValidInput() { // 입력이 한 글자 이상인지
                    signupViewModel.saveData()
                    dismiss()
                } else {
                    print("잘못된 입력")
                }
            } , label : {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("green01"))
                        .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .center)
                    
                    Text("생성하기")
                        .foregroundStyle(Color("white01"))
                        .font(.makeMedium18)
                }
            })
            
            
        }
        
        .padding(.horizontal, 19)
        .padding(.top, 210)
        .padding(.bottom, 72)
        
        .navigationBarBackButtonHidden(true)
            
            
        }
    
    
    private func isValidInput() -> Bool {
            return !signupViewModel.nickName.isEmpty &&
                   !signupViewModel.email.isEmpty &&
                   !signupViewModel.password.isEmpty
        }
    
    
    struct NavigationBarView : View {
        @Environment(\.dismiss) var dismiss
        var body: some View {
            HStack{
                Button(action: {
                    dismiss()
                    print("돌아가기 버튼 클릭")
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)

                }
                Spacer()
                Text("가입하기")
                Spacer()
                Text("   ")
                
            }.padding(.horizontal, 20)
        }
        
    }
        
}



#Preview {
    SignupView()
        .environmentObject(NavigationRouter())
}

