//
//  AdbannerView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/24/25.
//

import SwiftUI

struct AdbannerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
            VStack{
                
                Image("adbanner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                
                Spacer()
                
                VStack{
                    
                    Button(action: {
                        print("자세히 보기 버튼 클릭")
                    } , label : {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("green01"))
                                .frame(height:58)
                            
                            Text("자세히 보기")
                                .foregroundStyle(Color("white01"))
                                .font(.makeMedium18)
                        }
                    }
                    )
                    .padding(.horizontal, 19)
                    
                    
                    HStack{ Spacer()
                        Button(action: {
                            dismiss()
                            print("닫기 버튼 클릭")
                        }) {
                            Text("X 닫기")
                                .foregroundStyle(Color("gray05"))
                                .font(.mainTextLight14)
                        }
                        
                    }
                    .padding(.trailing, 35)
                    
                    
                }
                .padding(.vertical, 10)
                //.border(Color.red)
                
                
                
            }
            .padding(.bottom, 36)
            .frame(width: .infinity, height: .infinity)
            .ignoresSafeArea()
            
        }
    }

#Preview {
    AdbannerView()
}

