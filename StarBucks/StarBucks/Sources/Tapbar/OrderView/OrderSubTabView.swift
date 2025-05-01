// OrderSubTabView.swift
import SwiftUI

struct OrderSubTabView: View {
    @ObservedObject var viewModel: OrderViewModel

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer().frame(width: 23)
                ForEach(OrderTotalTab.allCases) { tab in
                    VStack {
                        Button {
                            viewModel.selectedTotalTab = tab
                        } label: {
                            Text(tab.rawValue)
                                .font(.PretendardSemiBold16)
                                .foregroundColor(viewModel.selectedTotalTab == tab ? .black : .gray)
                        }
                        .padding(.horizontal)

                        if viewModel.selectedTotalTab == tab {
                            Capsule()
                                .fill(Color.green)
                                .frame(height: 3)
                        } else {
                            Color.clear.frame(height: 3)
                        }
                    }
                }
                Spacer()
            }
            .padding(.vertical, 8)
            Divider()

            // 각 탭별 뷰
            switch viewModel.selectedTotalTab {
            case .drink:
                DrinkListView(drinks: dummyOrderDrinks)       //
            case .food:
                FoodListView()
            case .product:
                ProductListView()
            }
        }
    }
}
