//
//  OtherView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/24/25.
//
import Foundation
import SwiftUI

struct OtherView: View {
    
    @StateObject private var otherviewModel = OtherViewModel()
    //@Environment(\.dismiss) var dismiss
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        
        HStack{
            
            Text("Other")
                .font(.mainTextBold24)
            
            Spacer()
            
            Button(action: {
                router.logout()
            }) {
                Image("Logout")
                    
            }
           
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)

        //.border(Color.gray)
        
        VStack{
            VStack{
                VStack{
                    
                    HStack{
                        
                        Text(otherviewModel.nickName.isEmpty ? "(작성한 닉네임)" : "\(otherviewModel.nickName)")
                            .font(.mainTextSemiBold24)
                            .foregroundStyle(Color("green01"))
                        Text("님")
                            .font(.mainTextSemiBold24)
                    }
                    Spacer() .frame(height:5)
                    
                    Text("환영합니다! 🙌🏻")
                        .font(.mainTextSemiBold24)
                    
                    
                }
                .padding()
            
                //.border(Color.red)
                
                HStack(spacing : 10.5){
                    ButtonView(title: "별 히스토리")
                        .environmentObject(router)
                    ButtonView(title: "전자영수증")
                        .environmentObject(router)
                    ButtonView(title: "나만의 메뉴")
                        .environmentObject(router)
                }
                .padding(.horizontal, 24)
                //.border(Color.red)
                Spacer()
                
                VStack (alignment: .leading){
                    
                    Text("Pay")
                        .font(.mainTextSemiBold18)
                    Spacer() .frame(height: 32)
                    
                    HStack{
                        VStack (alignment:.leading, spacing: 32) {
                            PayandCSView(title: "스타벅스 카드 등록")
                            PayandCSView(title: "쿠폰 등록")
                        }
                        Spacer()
                        VStack (alignment:.leading, spacing: 32) {
                            PayandCSView(title: "카드 교환권 등록")
                            PayandCSView(title: "쿠폰 히스토리")
                        }
                        
                    }
                    Divider()
                        .frame(width:317)
                    //.border(Color.blue)
                    .padding(.vertical, 16)
                    
                }
                
                //.border(Color.red)
                Spacer()
                
                
                VStack (alignment: .leading){
                    
                    
                    Text("고객지원")
                        .font(.mainTextSemiBold18)
                    Spacer() .frame(height: 32)
                    
                    HStack{
                        VStack (alignment:.leading, spacing: 32) {
                            PayandCSView(title: "스토어 케어")
                            PayandCSView(title: "매장 정보")
                            
                        }
                        Spacer()
                        VStack (alignment:.leading, spacing: 32) {
                            PayandCSView(title: "고객의 소리")
                            PayandCSView(title: "반납기 정보")
                        }
                        
                    }
                    //.border(Color.blue)
                    Spacer() .frame(height: 32)
                    PayandCSView(title: "마이 스타벅스 리뷰")
                    
                }
                //.border(Color.red)
            }
            //.border(Color.yellow)
            .padding(.horizontal, 20)
            .padding(.vertical, 41)
            
            
            
        }
        .background(Color("white01"))
        .frame(maxWidth: .infinity, alignment: .center)
        //.border(Color.black)
        
        VStack{
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        
        .navigationBarBackButtonHidden(true)
    }
    
   
    
    
    
    
    
    struct PayandCSView: View {
        var title: String
        var body: some View {
            Button(action: {
                print(title)
            } , label : {
                
                HStack (spacing:4) {
                    Image(title)
                        .frame(width:32, height: 32)
                    
                    Text(title)
                        .foregroundStyle(Color("black02"))
                        .font(.mainTextSemiBold16)
                    
                    
                }
            }
                   
                   
            )
            .frame(width: 157, alignment: .leading)
        
            
        }
        
    }
}

struct ButtonView: View {
    var title: String
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        
        Button(action: {
            if title == "전자영수증" {
                    print("전자영수증 버튼 눌림")
                    router.navigateToReceipt()
                }
        } , label : {
            ZStack{
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white)
                    .frame(width:102, height: 108)
                    .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 0)
                
                
                VStack (spacing:4) {
                    Image(title)
                        .frame(width:38, height: 38)
                    
                    Text(title)
                        .foregroundStyle(Color("black03"))
                        .font(.mainTextSemiBold16)
                }
            }
        }
        )
    }
}

#Preview {
    OtherView()
        .environmentObject(NavigationRouter())
}
