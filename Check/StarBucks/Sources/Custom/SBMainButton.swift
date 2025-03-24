//
//  SBMainButton.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import SwiftUI

struct SBMainButton: View {
    
    let title: String
    
    let action: () -> Void
    
    let isEnable: Bool

        
    init(title: String, action: @escaping () -> Void, isEnable: Bool) {
        self.title = title
        self.action = action
        self.isEnable = isEnable
    }
    
    var body: some View {
        Button(action: { print("버튼 누름!") }, label: {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(!isEnable ? Color.gray02 : Color.green01)
        
                
                Text("로그인하기")
                    .font(.mainTextMedium16)
                    .foregroundStyle(.white)
            }
            .frame(height: 46)
        })
        .disabled(!isEnable)
    }
}

