//
//  ReceiptModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/8/25.
//

import Foundation
import SwiftData

@Model
class Receipt: Identifiable {
    var id: UUID
    var storeName: String
    var date: Date
    var totalAmount: Int
    var imageData: Data? // 이미지 1:1로 저장
    
    init(storeName: String, date: Date, totalAmount: Int, imageData: Data?) {
        self.id = UUID()
        self.storeName = storeName
        self.date = date
        self.totalAmount = totalAmount
        self.imageData = imageData
    }
}
