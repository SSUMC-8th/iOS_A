import SwiftUI

struct ShowReceiptView: View {
    let receipt: ReceiptsModel
    @Binding var isPresented: ReceiptsModel?

    var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()

            ZStack(alignment: .topTrailing) {
                if let data = receipt.imageData,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .padding()
                } else {
                    Text("이미지를 불러올 수 없습니다.")
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: {
                    isPresented = nil
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundStyle(Color.black)
                        .padding()
                })
                .padding(16)
            }
        }
    }
}

