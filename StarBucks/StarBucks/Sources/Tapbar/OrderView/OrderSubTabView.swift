//
//  OrderSubTabView.swift
//  StarBucks
//
//  Created by 한태빈 on 5/1/25.
//

import SwiftUI

struct OrderSubTabView: View {
    @ObservedObject var viewModel: OrderViewModel

    var body: some View {
        VStack{
            HStack() {
                Spacer().frame(width: 23)
                ForEach(OrderTotalTab.allCases) { tab in
                    VStack(alignment: .leading) {
                        Button(action: {
                            viewModel.selectedTotalTab = tab
                        }) {
                            Text(tab.rawValue)
                                .font(.PretendardSemiBold16)
                                .foregroundColor(viewModel.selectedTotalTab == tab ? Color(.black) : Color(.gray))
                            Image("new")
                            
                        }
                        .padding(.horizontal)
                    }
                }
                Spacer()
            }
         Divider()
        }
        
    }
}

#Preview {
    let vm = OrderViewModel()
    OrderSubTabView(viewModel: vm)
}
