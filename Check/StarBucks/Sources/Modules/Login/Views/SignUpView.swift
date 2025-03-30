//
//  SignUpView.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    // MARK: - @Bindable
    /// 뷰모델
    @Bindable private var viewModel: SignUpViewModel = .init()
    
    init(container: DIContainer) {

    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            SBNavigationBar(type: .leftBack) {
                container.navigationRouter.pop()
            }
            
            Spacer().frame(height: 210)
            
            textFieldSection
            
            Spacer()
            
            SBMainButton(title: "생성하기", action: {
                viewModel.createAccount()
                container.navigationRouter.pop()
            }, isEnable: viewModel.canCreateAccount)
        }
        .safeAreaPadding(.horizontal, 19)
        .safeAreaPadding(.bottom, 30)
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Properties
    /// 사용자에게 입력 받는 섹션
    private var textFieldSection: some View {
        VStack(spacing: 50) {
            
            SBTextField(text: $viewModel.enteredNickname, type: .nickname)
            
            SBTextField(text: $viewModel.enteredId, type: .id)
            
            SBTextField(text: $viewModel.enteredPassword, type: .password)
            
        }
    }
}

//#Preview {
//    SignUpView(container:)
//        .environmentObject(DIContainer())
//}
