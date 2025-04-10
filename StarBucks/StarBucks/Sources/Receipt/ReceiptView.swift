import SwiftUI
import SwiftData

struct ReceiptView: View {
    // ReceiptViewModel을 초기화합니다.
    @StateObject var viewModel: ReceiptViewModel
    
    // 기본 생성자: 외부에서 별도 주입할 수도 있으며, 기본값으로 새 인스턴스 생성
    init(viewModel: ReceiptViewModel = ReceiptViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            // 상단에 영수증 추가 및 내비게이션을 위한 ReceiptTop 뷰
            ReceiptTop(viewModel: viewModel)
            
            // 배경 색상과 함께 영수증 리스트를 보여주는 영역
            ZStack(alignment: .top) {
                Color(UIColor.systemGray6)
                ReceiptsView(viewModel: viewModel)
            }
        }
        .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .toolbar(.hidden, for: .navigationBar)
                .navigationBarBackButtonHidden(true)
                .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ReceiptsView: View {
    // ReceiptViewModel을 감시합니다.
    @ObservedObject var viewModel: ReceiptViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // 상단에 총 건수와 사용 합계를 표시합니다.
            HStack {
                Text("총")
                    .font(.PretendardMedium18) +
                Text(" \(viewModel.receipts.count)건")
                    .font(.PretendardMedium18)
                    .foregroundStyle(Color.orange)

                Spacer()
                Text("사용합계")
                    .font(.PretendardMedium18) +
                Text(" \(viewModel.receipts.reduce(0) { $0 + $1.totalPrice })")
                    .font(.PretendardMedium18)
                    .foregroundStyle(Color.orange)
            }
            .padding()
            
            // 스크롤 가능한 리스트로 ReceiptCard들을 표시합니다.
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.receipts) { receipt in
                        ReceiptCard(currentReceipt: receipt)
                            .foregroundStyle(Color.orange)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    // ReceiptView를 단일 표현식으로 반환하는 방식
    ReceiptView(viewModel: {
        // 여기에 필요한 더미 데이터, ViewModel 설정 등을 모두 처리
        let dummyImage = UIImage(systemName: "doc.plaintext")!
        let dummyData = dummyImage.jpegData(compressionQuality: 0.8)!
        
        let dummyReceipt1 = ReceiptModel(
            store: "스타벅스 강남점",
            totalPrice: 6500,
            imageData: dummyData,
            createdAt: Date(),
            time: "2025-04-10"
        )
        let dummyReceipt2 = ReceiptModel(
            store: "메가커피 역삼",
            totalPrice: 4200,
            imageData: dummyData,
            createdAt: Date(),
            time: "2025-04-10"
        )
        
        let viewModel = ReceiptViewModel()
        viewModel.receipts = [dummyReceipt1, dummyReceipt2]
        return viewModel
    }())
}
