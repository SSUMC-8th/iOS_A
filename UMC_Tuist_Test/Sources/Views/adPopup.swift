//
//  adPopup.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/22/25.
//

import SwiftUI

struct adPopup: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
//        GeometryReader { geometry in
            VStack {
                Image("ad")
                    .resizable()
                    .aspectRatio(contentMode: .fit) 
                
                Spacer()
                
                Button {
                    print("자세히 보기")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green01)
                            .frame(maxWidth: 402, maxHeight: 58)
                        Text("자세히 보기")
                            .font(.makeMedium18)
                            .foregroundStyle(Color.white01)
                    }
                }
                Spacer().frame(height: 19)
                
                HStack {
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("X 닫기")
                            .font(.mainTextLight14)
                            .foregroundStyle(Color.gray05)
                    }
                    .padding(.trailing, 38)
                }
                Spacer().frame(height: 36)
            }
//            .frame(width: geometry.size.width, height: geometry.size.height)
//        }
            .ignoresSafeArea(.all)
    }
}

#Preview {
    adPopup()
}
