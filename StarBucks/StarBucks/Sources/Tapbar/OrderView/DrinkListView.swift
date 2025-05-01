// OrderSubDrinkView.swift
import SwiftUI

struct DrinkListView: View {
    let drinks: [OrderDrink]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(drinks) { d in
                    HStack(spacing: 16) {
                        Image(d.imageName)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            ZStack(alignment: .topTrailing) {
                                Text(d.name)
                                if d.dot {
                                    Circle()
                                        .fill(.green)
                                        .frame(width: 6, height: 6)
                                        .offset(x: 6, y: -6)
                                }
                            }
                            Text(d.englishName)
                                .font(.footnote)
                                .foregroundColor(.gray)
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
