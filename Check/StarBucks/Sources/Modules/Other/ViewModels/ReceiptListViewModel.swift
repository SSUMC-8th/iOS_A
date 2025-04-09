//
//  ReceiptListViewModel.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import Foundation
import PhotosUI
import SwiftUI
import VisionKit
import Vision

@Observable
class ReceiptListViewModel {
    
    // MARK: - Properties
    /// Dialog가 나와있는가
    var showDialog = false
    
    /// 갤러리 열려있는가
    var showImagePicker = false
    
    /// 카메라 열려있는가
    var showCameraPicker = false
    
    /// 영수증 보고있는가
    var showReceiptIndex: Int? = nil
    
    /// 갤러리에서 선택한 사진
    var photosPickerItem: PhotosPickerItem?
    
    /// 현재 들고있는 이미지
    var uiImage: UIImage? {
        
        didSet {
            if let image = uiImage {
                performOCR(on: image)
            }
        }
    }
    
    /// 현재 영수증
    var receipt: ReceiptModel?
    
    /// OCR을 실행합니다
    /// - Parameter image: 현재 들고있는 이미지
    private func performOCR(on image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        let request = VNRecognizeTextRequest { [weak self] (request, error) in
            guard let self = self,
                  let results = request.results as? [VNRecognizedTextObservation],
                    error == nil else { return }
            
            let recognizedString = results.compactMap { $0.topCandidates(1).first?.string }.joined(
                separator: "\n"
            )
            
            let parsedModel = self.parseRecognizedText(recognizedString)
            
            DispatchQueue.main.async {
                self.receipt = parsedModel
            }
            
        }
        
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR"]
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage)
            try? handler.perform( [request])
        }
    }
    
    /// 텍스트를 영수증 모델으로 parse
    /// - Parameter recognizedText: OCR로 추출한 텍스트
    /// - Returns: 영수증 모델
    private func parseRecognizedText(_ recognizedText: String) -> ReceiptModel {
        let lines = recognizedText.components(separatedBy: .newlines)

        var orderer = "주문자 없음"
        var store = "장소 없음"
        var menuItems: [String] = []
        var totalAmount = 0
        var orderNumber = "주문번호 없음"

        var isMenuSection = false
        var i = 0

        print("===== OCR 디버그 시작 =====")

        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(
                in: .whitespacesAndNewlines
            )
            print("🔹 [\(i)] \(trimmed)")

            // 주문자
            if trimmed
                .range(of: #"\([A-Z]-\s*\d+\)"#, options: .regularExpression) != nil {
                orderer = trimmed.components(separatedBy: " ").first ?? "주문자 없음"
                isMenuSection = true
                i += 1
                continue
            }

            // 장소
            if store == "장소 없음", trimmed.contains("점") {
                store = "스타벅스 " + trimmed
            }

            // 결제 금액
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(
                    in: .whitespaces
                )
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                }
            }

            // 주문번호
            if trimmed.starts(with: "32"),
               trimmed.count >= 14,
               trimmed.allSatisfy({ $0.isNumber }) {
                orderNumber = trimmed
            }

            // 메뉴 종료
            if trimmed.contains("합계") || trimmed.contains("결제금액") {
                isMenuSection = false
                print("🛑 메뉴 종료 지점 도달")
            }

            // 음료 인식: T 포함 줄
            if isMenuSection,
               trimmed.contains("T"),
               !trimmed.hasPrefix("L"),
               !trimmed.contains("할인"),
               !trimmed.contains("데움") {
                        
                let cleanName = trimmed.components(separatedBy: ")").last?.trimmingCharacters(
                    in: .whitespaces
                ) ?? trimmed
                menuItems.append(cleanName)
            }

            i += 1
        }

        print("===== OCR 디버그 끝 =====")
        print("👤 주문자: \(orderer)")
        print("🏪 매장명: \(store)")
        print("☕️ 주문 음료: \(menuItems)")
        print("💰 결제 금액: \(totalAmount)")
        print("🧾 주문번호: \(orderNumber)")

        return ReceiptModel(
            orderer: orderer,
            store: store,
            menuItems: menuItems,
            totalAmount: totalAmount,
            orderNumber: orderNumber,
            image: uiImage?.pngData()
        )

    }
    
}
