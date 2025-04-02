//
//  CoffeeDetailsView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/1/25.
//

import SwiftUI
import Foundation



struct CoffeeDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    let coffeeType: CoffeeType
    @State private var selectedTemperature: CoffeeTemperature = .iced
    
    
        
    
    var body: some View {
       
        ZStack (alignment: .top){
            Image(coffeeType.imageName())
                .resizable()
                //.scaledToFit()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: 440, height: 355, alignment: .center)
                //.border(Color.red)
       
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    Image("back")
                }
                Spacer()
                Button(action: {
            
                }) {
                    Image("share")
                }
            }
            .padding(.horizontal, 20)
            .navigationBarBackButtonHidden(true)
            
               
        }
        Spacer().frame(height : 60)
        
        coffeeInfo
        
        Spacer().frame(height : 32)
        
        let availableTemperatures = coffeeType.availableTemperatures()
                
        if availableTemperatures.count > 1 {
     
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 400, height: 36)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 200, height: 36)
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 1)
                    .offset(x: selectedTemperature == .iced ? 100 : -100)
                    .animation(.easeInOut(duration: 0.2), value: selectedTemperature)
                
                HStack (spacing : 0) {
                    Text("HOT")
                        .foregroundStyle(selectedTemperature == .iced ? .gray : .red)
                        .font(.mainTextMedium16)
                        .frame(width: 200)
                       
                    
                    Text("ICED")
                        .foregroundStyle(selectedTemperature == .iced ? .blue : .gray)
                        .font(.mainTextMedium16)
                        .frame(width: 200)
                }
            }
            .onTapGesture {
                withAnimation {
                    selectedTemperature = (selectedTemperature == .iced) ? .hot : .iced
                }
            }
            .padding(.top, 10)
                            
        } else if availableTemperatures.contains(.hot) {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 400, height: 36)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 0.5)
                                    )
                Text("HOT ONLY")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.red)
                    .frame(width: 200)
            }
        } else if availableTemperatures.contains(.iced) {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 400, height: 36)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 0.5)
                                    )
                Text("ICED ONLY")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.blue)
                    .frame(width: 200)
            }
            
        }
        
        Spacer()
        
        OrderBtn
        
    }
    
    
    private var coffeeInfo: some View {
        VStack(alignment: .leading, spacing: 32) {
            
            VStack (alignment: .leading, spacing: 8) {
                HStack{
                    Text(coffeeType.name())
                        .font(.mainTextSemiBold24)
                    
                    Image("new")
                }
                
                Text(coffeeType.englishName())
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color("gray01"))
            }
            
            VStack (alignment: .leading, spacing: 20) {
                Text(coffeeType.description())
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color("gray06"))
                    
                
                Text(coffeeType.price())
                    .font(Font.custom("21 Heads", size: 24))
            }
            
            
        }
        .padding(.horizontal,10)
        
    }
    
    
    private var OrderBtn: some View {
        Button(action: {
            print("주문 버튼 클릭")
        } , label : {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("green01"))
                    .frame(width:383, height:43)
                
                Text("주문하기")
                    .foregroundStyle(Color.white)
                    .font(.mainTextMedium16)
            }
        }
        )
    }
}


#Preview {
    CoffeeDetailsView(coffeeType: .IcedCaramelMacchiato)
}
