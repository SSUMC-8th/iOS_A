//
//  LoginView.swift
//  StarBucks
//
//  Created by LEE on 3/17/25.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    // MARK: - @Bindable
    /// 뷰모델
    @Bindable private var viewModel: LoginViewModel = .init()
    
    init(container: DIContainer){
        
    }
    
    var body: some View {
        
        NavigationStack(path: $container.navigationRouter.destinations) {
            
            VStack(spacing: 50) {
                
                titleSection
                
                loginSection
                
                oAuthSection
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                    NavigationRoutingView(destination: destination)
                    .environmentObject(container)
            }
        }
    }
    
    /// 스타벅스 아이콘 및 인사 텍스트
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
    
    /// 아이디, 비밀번호 텍스트 필드 및 로그인 버튼
    private var loginSection: some View {
        
        VStack(spacing: 47) {
            
            SBTextField(text: $viewModel.enteredId, type: .id)
            SBTextField(text: $viewModel.enteredPassword, type: .password)
                    
            // TODO: - 로그인 버튼 탭 이벤트 구현
            SBMainButton(title: "로그인하기", action: {
                container.navigationRouter.push(to: .tabView)
                
            }, isEnable: viewModel.canLogin)
        }
        .safeAreaPadding(.horizontal, 19)
    }
    
    /// 이메일로 회원가입 버튼 및 OAuth 로그인 버튼
    private var oAuthSection: some View {
        
        VStack(alignment: .center, spacing: 19) {
            
            Button(action: {
                
                container.navigationRouter.push(to: .signUpView)
                
            }, label: {
                Text("이매일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color.gray04)
                    .underline(true, color: .gray04)
            })
            
            // TODO: - 카카오 로그인 구현
            Button(action: { print("카카오 로그인") }, label: {
                Icon.kakao_login.image

            })
                
            // TODO: - 애플 로그인 구현
            Button(action: { print("애플 로그인") }, label: {
                Icon.apple_login.image
            })
            
        }
    }
    
}

#Preview {
    LoginView(container: .init())
        .environmentObject(DIContainer())
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LoginView()
//                .previewDevice("iPhone 11")
//                .previewDisplayName("iPhone 11")
//            
//            LoginView()
//                .previewDevice("iPhone 16 Pro Max")
//                .previewDisplayName("iPhone 16 Pro Max")
//        }
//    }
//}
