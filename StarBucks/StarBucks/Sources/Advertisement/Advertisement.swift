import SwiftUI

struct Advertisement: View {
    @Environment(\.dismiss) private var dismiss // 디

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                let screenWidth = geometry.size.width
                let imageRatio: CGFloat = 1.64

                Image("ad")
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth, height: screenWidth * imageRatio)
                    .clipped()

                Spacer().frame(height: 70)

                HStack {
                    Spacer().frame(width: 18)
                    Button(action: {
                        print("자세히 보기")
                    }) {
                        Text("자세히 보기")
                            .font(.PretendardMedium18)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 46)
                            .background(Color("StarBucksGreen"))
                            .cornerRadius(20)
                    }
                    Spacer().frame(width: 18)
                }

                Spacer().frame(height: 19)

                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Text("X 닫기")
                            .font(.PretendardLight14)
                            .foregroundColor(Color("StarBucksGray"))
                    }
                    .padding(.trailing, 36)
                }
            }
        }
    }
}

#Preview {
    Advertisement()
}
