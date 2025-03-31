import SwiftUI

struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()

    var body: some View {
        VStack(spacing: 40) {
            // 닉네임
            VStack(alignment: .leading, spacing: 8) {
                TextField("닉네임", text: $viewModel.signupModel.nickname)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.PretendardRegular13)
                    .accentColor(Color("StarBucksGreen"))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.4))
            }

            // 이메일
            VStack(alignment: .leading, spacing: 8) {
                TextField("이메일", text: $viewModel.signupModel.email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.PretendardRegular13)
                    .accentColor(Color("StarBucksGreen"))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.4))
            }

            // 비밀번호
            VStack(alignment: .leading, spacing: 8) {
                SecureField("비밀번호", text: $viewModel.signupModel.password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.PretendardRegular13)
                    .accentColor(Color("StarBucksGreen"))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.4))
            }

            // 버튼
            Button(action: {
                viewModel.storageData()
            }) {
                Text("생성하기")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("StarBucksGreen"))
                    .cornerRadius(20)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 40)
    }
}

#Preview {
    SignupView()
}
