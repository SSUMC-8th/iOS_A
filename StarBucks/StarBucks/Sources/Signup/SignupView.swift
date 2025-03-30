//
//  SignupView.swift
//  StarBucks
//
//  Created by 한태빈 on 3/25/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()

    var body: some View {
        VStack(spacing: 20) {
            TextField("닉네임", text: $viewModel.signupModel.nickname)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.PretendardRegular13)
                .accentColor(Color("StarBucksGreen"))
                .padding(.vertical, 8)

            TextField("이메일", text: $viewModel.signupModel.email)
                .keyboardType(.emailAddress)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.PretendardRegular13)
                .accentColor(Color("StarBucksGreen"))
                .padding(.vertical, 8)

            SecureField("비밀번호", text: $viewModel.signupModel.password)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.PretendardRegular13)
                .accentColor(Color("StarBucksGreen"))
                .padding(.vertical, 8)

            Button(action: {
                viewModel.storageData()
            }) {
                Text("생성하기")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    SignupView()
}
