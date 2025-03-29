//
//  SignupView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/24/25.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var signupViewModel = SignupViewModel()
    
    var body: some View {
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
                signupViewModel.saveData()
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
        
                   
               
        }
        
    }


#Preview {
    SignupView()
}
