//
//  OrderSubDrinkView.swift
//  StarBucks
//
//  Created by 한태빈 on 5/1/25.
//

import SwiftUI

struct DrinkListView: View {
    let drinks: [OrderDrink]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(drinks) { drink in
                    HStack(spacing: 16) {
                        Image(drink.imageName)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            ZStack(alignment: .topTrailing) {
                                Text(drink.name)
                                    .font(.PretendardSemiBold16)
                                    .foregroundColor(Color(.gray))
                                
                                if drink.dot {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 6, height: 6)
                                        .offset(x: 6, y: -6)
                                }
                            }
                            Text(drink.englishName)
                                .font(.PretendardSemibold13)
                                .foregroundColor(Color(.gray))
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    DrinkListView(drinks: dummyOrderDrinks)
}
