import SwiftUI

struct ReceiptCard: View {
    var currentReceipt: ReceiptModel
    @State private var showImage = false // 이미지 보기용 상태 변수
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(currentReceipt.store)
                .padding(.horizontal)
                .font(.PretendardSemiBold18)
            
            HStack {
                Text(currentReceipt.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .font(.PretendardMedium13)
                    .foregroundStyle(Color("StarBucksGray"))
                Spacer()
                Button(action: {
                    showImage = true
                }) {
                    Image("receiptIcon")
                }
                .sheet(isPresented: $showImage) {
                    if let data = currentReceipt.imageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    } else {
                        Text("⚠️ 이미지를 불러올 수 없습니다.")
                    }
                }
            }
            .padding(.horizontal)
            
            Text("\(currentReceipt.totalPrice)원")
                .font(.PretendardSemiBold18)
                .foregroundStyle(Color.orange)
                .padding()
        }
    }
}
