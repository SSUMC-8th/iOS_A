//
//  SelectStoreView.swift
//  StarBucks
//
//  Created by 한태빈 on 5/1/25.
//

import SwiftUI

struct StoreSelectBar: View {
    @ObservedObject var vm:OrderViewModel

    var body: some View {
        VStack{
            HStack {
                Text("주문할 매장을 선택해 주세요")
                    .foregroundColor(.white)
                    .font(.PretendardSemiBold16)
                Spacer()
                Button(action: {
                    // 화살표 버튼 액션
                    vm.isStoreSheetPresented = true
                }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                }
            }
            Rectangle()
                .fill(Color(.gray))
                .frame(height: 1)
        }
        .padding()
        .background(Color(.black))
        .sheet(isPresented: $vm.isStoreSheetPresented) {
            StoreSheetView(viewModel: vm)
                .presentationDragIndicator(.visible)         // ⬆ 드래그 표시줄
        }
    }
}


#Preview {
    let vm = OrderViewModel()
    StoreSelectBar(vm: vm)
}
