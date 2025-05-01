//
//  StoreSelectView.swift
//  StarBucks
//
//  Created by LEE on 5/1/25.
//

import SwiftUI

struct StoreSelectView: View {
    
    @State var enteredString: String = ""
    @State var selectedSort: String = "가까운 매장"
    
    var body: some View {
        VStack(spacing: 10) {
            
            Capsule()
                .fill(Color.gray04)
                .frame(width: 70, height: 4)
                .padding(.top, 10)
            
            
            ZStack {
                Text("매장 설정")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.black03)
                
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "map")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .foregroundStyle(Color.gray04)
                    })
                }
            }
            .safeAreaPadding(.horizontal, 32)
            .padding(.bottom, 10)
                        
            TextField("검색", text: $enteredString)
                .font(.mainTextSemiBold13)
                .padding(6)
                .background(Color.gray00.opacity(0.5))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .frame(height: 27)

            sortSegment
            
            Spacer()

        }
    }
    
    private var sortSegment: some View {
        HStack(spacing: 10) {
            Button(action: {
                selectedSort = "가까운 매장"
            }, label: {
                Text("가까운 매장")
                    .font(selectedSort == "가까운 매장" ? .mainTextSemiBold13 : .mainTextRegular13)
                    .foregroundStyle(selectedSort == "가까운 매장" ? Color.black03 : Color.gray03)
            })
                
            Divider()
                .frame(width: 2, height: 20)
            
            Button(action: {
                selectedSort = "자주 가는 매장"
            }, label: {
                Text("자주 가는 매장")
                    .font(selectedSort == "자주 가는 매장" ? .mainTextSemiBold13 : .mainTextRegular13)
                    .foregroundStyle(selectedSort == "자주 가는 매장" ? Color.black03 : Color.gray03)
            })
        
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    StoreSelectView()
}
