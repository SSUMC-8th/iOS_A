//
//  SBMainButton.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import SwiftUI

struct SBMainButton: View {
    
    // MARK: - Properties
    /// 버튼 타이틀
    let title: String
    
    /// 버튼 탭 시 실행
    let action: () -> Void
    
    /// 버튼을 누를 수 있는가
    let isEnable: Bool

    // MARK: - Initializer
    /// 생성자
    /// - Parameters:
    ///   - title: 버튼 제목
    ///   - action: 버튼 탭 시 실행
    ///   - isEnable: 버튼을 누를 수 있는 상태인가
    init(title: String, action: @escaping () -> Void, isEnable: Bool) {
        self.title = title
        self.action = action
        self.isEnable = isEnable
    }
    
    var body: some View {
        Button(action: { action() }, label: {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(!isEnable ? Color.gray02 : Color.green01)
        
                
                Text(title)
                    .font(.mainTextMedium16)
                    .foregroundStyle(.white)
            }
            .frame(height: 46)
        })
        .disabled(!isEnable)
    }
}

