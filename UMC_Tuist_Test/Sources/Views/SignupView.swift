//
//  SignupView.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/22/25.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var newUser = SignupViewModel()
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    TextField("닉네임", text: $newUser.signupModel.nickname)
                        .font(.mainTextRegular18)
                        .disableAutocorrection(true)
                    
                    Divider()
                        .overlay(Color.gray00)
                }
                
                Spacer()
                
                VStack {
                    TextField("이메일", text: $newUser.signupModel.email)
                        .font(.mainTextRegular18)
                        .disableAutocorrection(true) /* 자동수정 안되도록 함 */
                        .textInputAutocapitalization(.never) /* 첫번째 글짜가 대문자로 바뀌는 문제 해결 */
                    
                    Divider()
                        .overlay(Color.gray00)
                }
                
                Spacer()
                
                VStack {
                    TextField("비밀번호", text: $newUser.signupModel.password)
                        .font(.mainTextRegular18)
                        .disableAutocorrection(true)
                    
                    Divider()
                        .overlay(Color.gray00)
                }
            }
            .frame(maxWidth: 402, maxHeight: 188, alignment: .center)
            
            Spacer()
        
            Button(action: {
                newUser.SaveUserData()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green01)
                        .frame(maxWidth: 402, maxHeight: 58, alignment: .bottom)
                    Text("생성하기")
                        .font(.makeMedium18)
                        .foregroundStyle(Color.white01)
                }
            })
        }
        .frame(maxWidth: 402, maxHeight: 674)
        .padding(.top, 210)
        .padding(.bottom, 72)
        .padding(.horizontal, 19)
    }
}

#Preview {
    SignupView()
}
