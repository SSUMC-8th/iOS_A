//
//  PayCard.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import SwiftUI

struct PayCard: View {
    
    // MARK: - Properties
    /// 버튼 제목
    let title: String
    
    /// 버튼 이미지
    let image: Image
    
    /// 버튼 누를 때 액션
    let action: () -> Void
    
    init(title: String, image: Image, action: @escaping () -> Void) {
        self.title = title
        self.image = image
        self.action = action
    }
    
    var body: some View {
        Button(action: { action() }, label: {
            HStack(spacing: 4) {
                image
                
                Text(title)
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(Color.black02)
                    .lineLimit(1)
                    
                Spacer()
                
            }
            .frame(width: 180)

        })
    }
}
