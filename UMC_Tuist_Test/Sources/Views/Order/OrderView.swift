import SwiftUI

struct OrderView: View {
    @State private var selectedSegment: SegmentType = .allMenu
    @State private var AllSegment: AllSegmentType = .beverage
    @State private var showStores = false
    @Namespace var name
    
    let order: OrderModel
    init(order: OrderModel = .Recomendation) {
        self.order = order
    }
    
    var body: some View {
        VStack {
            VStack {
                Spacer().frame(height: 59)
                HStack {
                    Text("Order")
                        .font(.mainTextBold24)
                        .padding(.horizontal, 23)
                    Spacer()
                }
                
                Spacer().frame(height: 6)
                
                VStack(spacing: 0) {
                    HStack {
                        ForEach(SegmentType.allCases){ segment in
                            Button(action: {
                                withAnimation(.easeInOut){
                                    selectedSegment = segment
                                }
                            }) {
                                HStack(spacing: 4) {
                                    
                                    if let imageName = segment.imageName {
                                        Image(imageName)
                                    }
                            
                                    Text(segment.rawValue)
                                        .font(.mainTextSemiBold16)
                                        .foregroundStyle(segment.textColor)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 13)
                                }
                            }
                        }
                    }
                    .background(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    
                    
                    ZStack(alignment: .leading) {
                        
                        GeometryReader { geo in
                            let segmentCount = CGFloat(SegmentType.allCases.count)
                            let segmentWidth = geo.size.width / segmentCount
                            let index = CGFloat(SegmentType.allCases.firstIndex(of: selectedSegment) ?? 0)
                            
                            Capsule()
                                .fill(Color.green01)
                                .frame(width: segmentWidth, height: 3)
                                .offset(x: segmentWidth * index)
                                .matchedGeometryEffect(id: "Tab", in: name)
                                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        }
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                    .frame(height: 3)
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
        .ignoresSafeArea(.all)
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
                                .foregroundStyle(AllSegment == segment ? Color.black01 : Color.gray04)
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
                                HStack(spacing: 1) {
                                    Text(order.BeverageKoreaName())
                                        .font(.mainTextSemiBold16)
                                        .foregroundStyle(Color.gray06)
                                    if order.IsThereDot() {
                                        VStack {
                                            Image("dot")
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                }
                                HStack {
                                    Text(order.BeverageEnglishName())
                                        .font(.mainTextSemiBold13)
                                        .foregroundStyle(Color.gray03)
                                    Spacer()
                                }
                            }
                            .frame(height: 21)
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
