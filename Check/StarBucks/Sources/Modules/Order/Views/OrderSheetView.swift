//
//  OrderSheetView.swift
//  StarBucks
//
//  Created by LEE on 5/1/25.
//

import SwiftUI
import CoreLocation
import MapKit

struct OrderSheetView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    @State var viewModel: OrderSheetViewModel = .init()
    
    @Bindable var locationManager = LocationManager.shared
    
    @Bindable var motionManager = MotionManager()
    
    @State var enteredString: String = ""
    @State var selectedSort: String = "가까운 매장"
    
    @State var mapDisplayed: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            headerView
            
            if mapDisplayed {
                
                MapView(starbucksList: $viewModel.starBucksList)
                                
            } else {
                scrollView
            }

            Spacer()

        }
        .task {
            viewModel.loadStarbucksData { result in
                switch result {
                case .success(_):
                    print("성공")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
    private var headerView: some View {
        
        VStack {
            Capsule()
                .fill(Color.gray04)
                .frame(width: 70, height: 4)
                .padding(.top, 20)
                
            Spacer().frame(height: 18)
            
            ZStack {
                Text("매장 설정")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.black03)
                
                HStack {
                    Spacer()
                    Button(action: {
                        mapDisplayed.toggle()
                        
                    }, label: {
                        mapDisplayed ?
                        
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .foregroundStyle(Color.gray04)
                        
                        :
                        
                        Image(systemName: "map")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .foregroundStyle(Color.gray04)
                    })
                }
            }
            .safeAreaPadding(.horizontal, 20)
            .padding(.bottom, 20)
            
            TextField("검색", text: $enteredString)
                .font(.mainTextSemiBold13)
                .padding(6)
                .background(Color.gray00.opacity(0.5))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .frame(height: 27)
            
            Spacer().frame(height: 18)
            
            sortSegment
                .padding(.bottom, 10)
            
            Divider()
                .frame(height: 3)
                .safeAreaPadding(.horizontal, 20)
        }
        
    }
    private var sortSegment: some View {
        HStack(spacing: 10) {
            Button(
                action: {
                    selectedSort = "가까운 매장"
                },
                label: {
                    Text("가까운 매장")
                        .font(
                            selectedSort == "가까운 매장" ? .mainTextSemiBold13 : .mainTextRegular13
                        )
                        .foregroundStyle(
                            selectedSort == "가까운 매장" ? Color.black03 : Color.gray03
                        )
                })
                
            Divider()
                .frame(width: 2, height: 20)
            
            Button(
                action: {
                    selectedSort = "자주 가는 매장"
                },
                label: {
                    Text("자주 가는 매장")
                        .font(
                            selectedSort == "자주 가는 매장" ? .mainTextSemiBold13 : .mainTextRegular13
                        )
                        .foregroundStyle(
                            selectedSort == "자주 가는 매장" ? Color.black03 : Color.gray03
                        )
                })
        
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
    /// 스크롤 뷰
    private var scrollView: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(viewModel.sortedStarBucksList, id: \.id) { store in
                    makeItem(store: store)
                }
            }
        }
        .contentMargins(.top, 20)

    }
    
    @ViewBuilder
    private func makeItem(store: StarbucksFeature) -> some View {
        HStack(spacing: 20) {
            Icon.starbucks_store.image
                .resizable()
                .frame(width: 83, height: 83)
            
            VStack(alignment: .leading) {
                Text(store.properties.storeName)
                    .font(.mainTextSemiBold13)
                    .foregroundStyle(Color.black03)
                    .padding(.bottom, 3)
                
                Text(store.properties.address)
                    .font(.mainTextMedium10)
                    .foregroundStyle(Color.gray02)
                    .padding(.bottom, 15)
                
                HStack {
                    if store.properties.category == .dt {
                        Icon.drive.image
                    } else if store.properties.category == .reserve {
                        Icon.reserve.image
                    }
                    
                    Spacer()
                    
                    Text(String(format: "%.1f", store.distanceKm ?? 0) + "km")
                        .font(.mainTextMedium12)
                        .foregroundStyle(Color.black01)
                }
            }
        }
        .padding(.horizontal, 20)

    }
    
}
