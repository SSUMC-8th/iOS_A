//
//  OrderView.swift
//  StarBucks
//
//  Created by 한태빈 on 3/29/25.
//

import SwiftUI

struct OrderView: View {
    @StateObject private var vm = OrderViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // 1) 메인 탭 바
            OrderMainTabView(viewModel: vm)
            
            // 2) “전체” 탭일 때만 서브 뷰 호출
            if vm.selectedTab == .all {
                OrderSubTabView(viewModel: vm)
                    .padding(.top)
            }
            
            // 3) 스토어 선택 바
            StoreSelectBar(vm: vm)
        }
        .padding(.top)
    }
}
