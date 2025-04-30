//
//  StoreSheetView.swift
//  StarBucks
//
//  Created by 한태빈 on 5/1/25.
//

import SwiftUI
struct StoreSheetView: View {
    @ObservedObject var viewModel: OrderViewModel

    var body: some View {
        VStack(spacing: 16) {
            // 1. 네비게이션
            HStack {
                Spacer()
                Text("매장 설정")
                    .font(.PretendardMedium16)
                    .foregroundColor(Color(.black))
                Spacer()
                Button(action: {
                    viewModel.isMapMode.toggle()
                }) {
                    Image(systemName: viewModel.isMapMode ? "list.bullet" : "map")
                        .resizable()
                        .frame(width: 18, height: 17)
                        .foregroundColor(Color(.gray))
                }
            }
            .padding()

            // 2. 검색바
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.1))
                .frame(height: 36)
                .overlay(
                    HStack {
                        Text("검색")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        Spacer()
                    }
                )
                .padding(.horizontal)

            // 3. 세그먼트 버튼
            HStack(spacing: 16) {
                Button(action: {
                    viewModel.StoreTab = .nearby
                }) {
                    Text("가까운 매장")
                        .font(
                            viewModel.StoreTab == .nearby ?
                            Font.pretend(type: .semibold, size: 13) :
                            Font.pretend(type: .regular, size: 13)
                        )
                        .foregroundColor(viewModel.StoreTab == .nearby ? Color(.black) : Color(.gray))
                }

                Divider()
                    .frame(height: 16)

                Button(action: {
                    viewModel.StoreTab = .frequent
                }) {
                    Text("자주 가는 매장")
                        .font(
                            viewModel.StoreTab == .frequent ?
                            Font.pretend(type: .semibold, size: 13) :
                            Font.pretend(type: .regular, size: 13)
                        )
                        .foregroundColor(viewModel.StoreTab == .frequent ? Color(.black) : Color(.gray))
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)
            
            // 4. 매장 리스트
            if viewModel.isMapMode {
                MapView(viewModel: viewModel)
            }else{
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.nearbyStores) { store in
                            StoreRowView(store: store, distance: store.distance(from: LocationManager.shared.currentLocation), viewModel: viewModel)
                            Divider().padding(.leading, 92)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
            
    }
}
#Preview {
    let vm = OrderViewModel()
    StoreSheetView(viewModel: vm)
}
