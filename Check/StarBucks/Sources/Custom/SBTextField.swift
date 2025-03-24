//
//  SBTextField.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import SwiftUI

/// StartBucks 앱의 텍스트 필드
struct SBTextField: View {
    
    // MARK: - Properties
    /// 바인딩될 문자열
    @Binding var text: String
    
    /// 텍스트 필드의 Focus 상태
    @FocusState var isFocused: Bool
    
    /// 텍스트 필드의 타입
    let type: SBTextFieldType
    
    /// 최대 문자열 길이
    let maxLength: Int = 20
    

    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Text(type.rawValue)
                .font($isFocused.wrappedValue || !text.isEmpty ? .mainTextRegular09 : .mainTextRegular13)
                .foregroundStyle($isFocused.wrappedValue ? Color.green02 : Color.black01)
                .offset(x: 0, y: $isFocused.wrappedValue || !text.isEmpty ? -15 : 0)
                .animation(.bouncy(duration: 0.3), value: $isFocused.wrappedValue)
            
            if type == .password {
                SecureField("", text: $text)
                    .focused($isFocused)
                    .font(.mainTextRegular13)
                    .onChange(of: text) { (oldValue, newValue) in
                        if newValue.count > maxLength {
                            text = oldValue
                        }
                    }
            } else {
                TextField("", text: $text)
                    .focused($isFocused)
                    .font(.mainTextRegular13)
                    .onChange(of: text) { (oldValue, newValue) in
                        if newValue.count > maxLength {
                            text = oldValue
                        }
                    }
            }

        }
        .padding(.bottom, 5)
        .overlay(
            Rectangle()
                .frame(height: 0.7)
                .foregroundColor($isFocused.wrappedValue ? Color.green02 : Color.gray00)
                .animation(.easeInOut(duration: 0.3), value: $isFocused.wrappedValue),
            alignment: .bottom
        )
    }
}

// MARK: Extension
extension SBTextField {
    
    // MARK: - Enums
    enum SBTextFieldType: String {
        
        case id = "아이디"
        case password = "비밀번호"
        case nickname = "닉네임"

    }
}
