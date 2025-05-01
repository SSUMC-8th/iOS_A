import SwiftUI

struct OrderView: View {
    @State private var selectedSegment: SegmentType = .allMenu
    @State private var AllSegment: AllSegmentType = .beverage
    @State private var showStores = false
    
    let order: OrderModel
    init(order: OrderModel = .Recomendation) {
        self.order = order
    }
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                HStack {
                    Text("Order")
                        .font(.mainTextBold24)
                        .padding(.horizontal, 23)
                    Spacer()
                }
                
                Spacer().frame(height: 6)
                
                HStack {
                    ForEach(SegmentType.allCases){ segment in
                        Button(action: {
                            withAnimation{
                                selectedSegment = segment
                            }
                        }) {
                            VStack {
                                Text(segment.rawValue)
                                    .font(.mainTextSemiBold16)
                                    .foregroundStyle(Color.black01)
                                    .padding(.vertical, 13)
                                
                                if selectedSegment == segment {
                                    Rectangle()
                                        .fill(Color.green01)
                                        .frame(height: 3)
                                }
                            }
                        }
                    }
                }
                
                ZStack {
                    Spacer().frame(height: 6)
                    
                    switch selectedSegment {
                    case .allMenu:
                        AllMenuView
                    case .myMenu:
                        MyMenuView
                    case .cakeReservation:
                        CakeReservationView
                    }
                    
                    SelectStore
                }
            }
        }
        .sheet(isPresented: $showStores) {
            OrderSheetView()
        }
    }
    
    private var AllMenuView: some View {
        VStack {
            HStack {
                ForEach(AllSegmentType.allCases){ segment in
                    Button(action: {
                        withAnimation{
                            AllSegment = segment
                        }
                    }) {
                        HStack {
                            Text(segment.rawValue)
                                .font(.mainTextSemiBold16)
                                .foregroundStyle(Color.black01)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 18)
                        }
                        Spacer().frame(width: 0)
                        Image("new")
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 23)
            
            Spacer().frame(height: 0)
            Divider()
            
            switch AllSegment {
            case .beverage:
                BeverageMenu
            case .food:
                Text("푸드")
            case .product:
                Text("상품")
            }
        }
    }
    
    private var BeverageMenu: some View {
        VStack {
            Spacer().frame(height: 19)
            
            ScrollView {
                VStack {
                    ForEach(OrderModel.allCases, id: \.self) { order in
                        HStack {
                            Image(order.CircleImageName())
                                .resizable()
                                .frame(width: 60, height: 60)
                            Spacer().frame(width: 16)
                            
                            VStack {
                                HStack {
                                    Text(order.BeverageKoreaName())
                                        .font(.mainTextSemiBold16)
                                        .foregroundStyle(Color.gray06)
                                    Spacer()
                                }
                                HStack {
                                    Text(order.BeverageEnglishName())
                                        .font(.mainTextSemiBold13)
                                        .foregroundStyle(Color.gray03)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(.bottom, 26)
                }
            }
        }
        .padding(.horizontal, 23)
    }
    
    private var MyMenuView: some View {
        Text("MyMenuView")
    }
    
    private var CakeReservationView: some View {
        Text("CakeReservationView")
    }
    
    private var SelectStore: some View {
        VStack {
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(Color.black02)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                
                Button(action: {
                    showStores = true
                }) {
                    VStack {
                        HStack {
                            Text("주문할 매장을 선택해 주세요")
                                .font(.mainTextSemiBold16)
                                .foregroundStyle(Color.white)
                            Spacer()
                            Image("down")
                        }
                        
                        Spacer().frame(height: 7)
                        Divider()
                            .overlay(Color.gray06)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
            }
        }
    }
}

#Preview {
    OrderView()
}
