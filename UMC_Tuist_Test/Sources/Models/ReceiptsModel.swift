import Foundation
import SwiftData

@Model
class ReceiptsModel: Identifiable {
    @Attribute(.unique) var id: UUID
    
    var store: String            // 장소
    var purchasedAt: String      // 날짜
    var totalAmount: Int         // 결제 금액
    var imageData: Data?         // 영수증 이미지
    var createdAt: Date          // 저장된 시점
    
    init(
        store: String,
        purchasedAt: String,
        totalAmount: Int,
        imageData: Data,
        createdAt: Date = Date()
    ) {
        self.id = UUID()
        self.store = store
        self.purchasedAt = purchasedAt
        self.totalAmount = totalAmount
        self.imageData = imageData
        self.createdAt = createdAt
    }
}
