//
//  CoffeeInfoView.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/29/25.
//

import SwiftUI

struct CoffeeInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedTemperature: TemperatureOption? = .hot
    
    let coffee: CoffeeInfoModel
    
    var body: some View {
        VStack {
            VStack {
                ImageFrame
                
                Spacer().frame(maxHeight: 20)
                
                VStack {
                    CoffeInfoContent
                    
                    Spacer().frame(maxHeight: 238)
                    
                    OrderButton
                }
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden()
    }
    
    private var ImageFrame: some View {
        ZStack {
            Image(coffee.returnImageName())
                .resizable()
                .frame(maxWidth: 440, maxHeight: 355)
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("back")
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        print("상단 오른쪽 버튼")
                    }, label: {
                        Image("shar")
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                }
                .padding(.horizontal, 8)
                .padding(.top, 40)
                Spacer()
            }
            .frame(maxWidth: 440, maxHeight: 355)
        }
    }
    
    private var CoffeInfoContent: some View {
        VStack {
            VStack {
                HStack(spacing: 4) {
                    Text(coffee.returnKoreanName())
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(Color.black03)
                    Image("new")
                        .resizable()
                        .frame(width: 20, height: 10)
                    Spacer()
                }
                .padding(.bottom, 4)
                HStack {
                    Text(coffee.returnEnglishName())
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(Color.gray01)
                    Spacer()
                }
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Text(coffee.returnInfo())
                        .font(.mainTextSemiBold14)
                        .foregroundStyle(Color.gray06)
                    Spacer()
                }
                Spacer().frame(height: 20)
                HStack {
                    Text(coffee.returnPrice())
                        .font(.mainTextBold24)
                        .foregroundStyle(Color.black03)
                    Spacer()
                }
            }
            
            Spacer()
            
            switch coffee.returnTemperature() {
            case 0: /*hot only*/
                ZStack {
                    RoundedRectangle(cornerRadius: 999)
                        .fill(Color.clear)
                        .stroke(Color.gray00, lineWidth: 1)
                        .frame(height: 36)
                        .frame(maxWidth: 420)

                    Text("HOT ONLY")
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(
                            Color(red: 1, green: 0, blue: 0).opacity(0.63)
                        )
                }
            case 1: /*cold only*/
                ZStack {
                    RoundedRectangle(cornerRadius: 999)
                        .fill(Color.clear)
                        .stroke(Color.gray00, lineWidth: 1)
                        .frame(height: 36)
                        .frame(maxWidth: 420)

                    Text("COLD ONLY")
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(
                            Color(red: 0, green: 0.13, blue: 0.98).opacity(0.63)
                        )
                }
            default: /* both */
                temperatureSelectionView
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: 420, maxHeight: 256)
    }
    
    private var OrderButton: some View {
        Button(action: {
            print("주문하기")
        }, label: {
            ZStack {
                Rectangle()
                    .fill(Color.green01)
                    .cornerRadius(20)
                    .frame(height: 43)
                    .frame(maxWidth: 383)
                    
                Text("주문하기")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.white01)
            }
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 28)
    }
    
    private var temperatureSelectionView: some View {
        
        ZStack {
            Rectangle()
                .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                .cornerRadius(999)
                .frame(maxWidth: 420, maxHeight: 36)
                
            HStack {
                Button(action: {
                    withAnimation {
                        selectedTemperature = .hot
                    }
                }) {
                    ZStack {
                        Rectangle()
                            .fill(
                                selectedTemperature == .hot ? Color.white : Color.clear
                            )
                            .cornerRadius(999)
                            .frame(maxWidth: 208, maxHeight: 36)
                            .shadow(
                                color: .black.opacity(0.25),
                                radius: 5,
                                x: 0,
                                y: 1
                            )
                        Text("HOT")
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(
                                selectedTemperature == .hot ? Color(
                                    red: 1,
                                    green: 0,
                                    blue: 0
                                )
                                .opacity(0.63) : Color.gray02
                            )
                    }
                }
                    
                Spacer()
                    
                Button(action: {
                    withAnimation {
                        selectedTemperature = .iced
                    }
                }) {
                    ZStack {
                        Rectangle()
                            .fill(
                                selectedTemperature == .iced ? Color.white : Color.clear
                            )
                            .cornerRadius(999)
                            .frame(maxWidth: 208, maxHeight: 36)
                            .shadow(
                                color: .black.opacity(0.25),
                                radius: 5,
                                x: 0,
                                y: 1
                            )
                        Text("ICED")
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(
                                selectedTemperature == .iced ? Color(
                                    red: 0,
                                    green: 0.13,
                                    blue: 0.98
                                )
                                .opacity(0.63) : Color.gray02
                            )
                    }
                }
            }
        }
    }
}


#Preview {
    CoffeeInfoView(coffee: CoffeeInfoModel.CafeAmericano)
}

