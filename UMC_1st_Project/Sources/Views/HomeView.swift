//
//  HomeView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/30/25.
//

import SwiftUI
import Foundation

struct HomeView: View {
    var body: some View {
        ScrollView {
            
            ZStack (alignment: .bottomLeading){
                Image("topbanner")

                VStack (alignment: .leading, spacing : 18){
                    Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                        .font(.mainTextBold24)
                        .lineSpacing(5)
                        //.border(Color.black)
                    
                    HStack {
                        Spacer()
                        Text("내용 보기")
                            .font(.mainTextRegular13)
                            .foregroundStyle(Color("gray06"))
                        Image("내용 보기 버튼")
                            
                    }
                    //.border(Color.blue)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 5)
            }
            .border(Color.red)
            
            VStack {
                Text("11★ until next Reward")
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
