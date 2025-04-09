//
//  ReceiptModel.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class ReceiptModel {
    @Attribute(.unique) var id: UUID
    @Attribute(.externalStorage) var image: Data? // 영수증 이미지
    
    var orderer: String           // 주문자
    var store: String             // 장소
    var menuItems: [String]       // 마신 음료
    var totalAmount: Int         // 결제 금액
    var orderNumber: String      // 주문번호
    var createdAt: Date          // 저장된 시점
    
    init(
            orderer: String,
            store: String,
            menuItems: [String],
            totalAmount: Int,
            orderNumber: String,
            image: Data?,
            createdAt: Date = Date()
        ) {
            self.id = UUID()
            self.orderer = orderer
            self.store = store
            self.menuItems = menuItems
            self.totalAmount = totalAmount
            self.orderNumber = orderNumber
            self.image = image
            self.createdAt = createdAt
        }
}
