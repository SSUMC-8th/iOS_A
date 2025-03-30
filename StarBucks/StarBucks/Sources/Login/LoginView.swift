import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @FocusState private var isIdFocused: Bool
    @FocusState private var isPwdFocused: Bool

    var body: some View {
        VStack {
            Spacer().frame(height: 104) // 상단 여백
            loginLogo
            loginTextField
            loginButton
            Spacer().frame(height: 90.95) // 하단 여백
        }
    }

    // 로그인 상단 뷰
    private var loginLogo: some View {
        Group {
            VStack(alignment: .leading) {
                Image("starbucklogo")
                    .resizable()
                    .frame(width: 97, height: 95)
                Spacer().frame(height: 29)
                Text("안녕하세요.\n스타벅스입니다!")
                    .font(.PretendardExtraBold24)
                    .padding(.bottom, 15)
                Text("회원 서비스 이용을 위해 로그인 해주세요")
                    .font(.PretendardMedium16)
                    .foregroundStyle(Color(.gray))
            }
            .frame(maxWidth: 402, minHeight: 270, alignment: .leading)
            .padding(19)
        }
    }

    // 로그인 텍스트필드
    private var loginTextField: some View {
        Group {
            VStack(spacing: 0) {
                // 아이디 입력
                TextField("아이디", text: $viewModel.id)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.PretendardRegular13)
                    .accentColor(Color("StarBucksGreen"))
                    .focused($isIdFocused)
                    .padding(.vertical, 8)

                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(isIdFocused ? Color("StarBucksGreen") : .gray)

                Spacer().frame(height: 20)

                // 비밀번호 입력
                SecureField("비밀번호", text: $viewModel.pwd)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.PretendardRegular13)
                    .accentColor(Color("StarBucksGreen"))
                    .focused($isPwdFocused)
                    .padding(.vertical, 8)

                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(isPwdFocused ? Color("StarBucksGreen") : .gray)


                Spacer().frame(height: 47)

                // 로그인 버튼
                Button(action: {
                    print("로그인 버튼")
                }) {
                    Text("로그인하기")
                        .font(.PretendardMedium16)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .background(Color("StarBucksGreen"))
                        .cornerRadius(20)
                }
            }
        }
        .frame(maxWidth: 402, minHeight: 180)
        .padding(19)
    }

    // 하단 로그인
    private var loginButton: some View {
        VStack(alignment: .center) {
            Text("이메일로 회원가입하기")
                .font(.PretendardRegular12)
                .foregroundStyle(Color(.gray))
                .underline()
                .padding(.bottom, 10)

            Image("KaKaoLogin")
                .resizable()
                .frame(width: 305, height: 45)
                .padding(.bottom, 10)

            Image("AppleLogin")
                .resizable()
                .frame(width: 305, height: 45)
        }
        .frame(maxWidth: 306, minHeight: 104)
        .padding(.top, 30)
    }
}

#Preview {
    LoginView()
}
