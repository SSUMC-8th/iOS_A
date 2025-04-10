//
//  ReceiptModel.swift
//  StarBucks
//
//  Created by 한태빈 on 4/10/25.
//

import Foundation
import SwiftData


@Model
class ReceiptModel {
    @Attribute(.unique) var id: UUID
    var store: String
    var totalPrice: Int       // ← 추가 (totalPrice 사용)
    var imageData: Data?      // ← 이미지가 필요하다면 추가
    var createdAt: Date
    var time: String

    init(
        store: String,
        totalPrice: Int,
        imageData: Data? = nil,
        createdAt: Date = Date(),
        time: String
    ) {
        self.id = UUID()
        self.store = store
        self.totalPrice = totalPrice
        self.imageData = imageData
        self.createdAt = createdAt
        self.time = time
    }
}
