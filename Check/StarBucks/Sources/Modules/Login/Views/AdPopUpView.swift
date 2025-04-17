//
//  AdPopUpView.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import SwiftUI

struct AdPopUpView: View {
    
    // MARK: - @Environment
    /// 화면 dismiss
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - @AppStorage
    /// 광고를 봤는가
    @AppStorage("didPopup") private var didPopup: Bool = false
    
    var body: some View {

        VStack {
            Icon.ad_image.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            SBMainButton(title: "자세히 보기", action: {print("자세히보기")}, isEnable: true)
                .padding(.horizontal, 19)
                .padding(.bottom, 10)
            
            Button(action: {
                didPopup = true 
                dismiss()
            }, label: {
                
                HStack {
                    
                    Spacer()
                    
                    Text("X 닫기")
                        .font(.mainTextLight14)
                        .foregroundStyle(Color.gray05)
                        .padding(.trailing, 40)
                    
                }
            })
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    AdPopUpView()
}
