import Foundation
import SwiftUI
import Vision

class ReceiptsViewModel: ObservableObject {
    @Published var receipts: [ReceiptsModel] = []
    @Published var currentReceipt: ReceiptsModel?

    func startOCR(_ image: UIImage) {
        guard let cgImage = image.cgImage,
              let imageData = image.pngData() else {
            self.currentReceipt = nil
            return
        }

        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                self?.currentReceipt = nil
                return
            }

            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")

            DispatchQueue.main.async {
                let parsed = self.parseWithoutRegex(from: fullText, imageData: imageData)
                self.currentReceipt = parsed
                self.receipts.append(parsed)
            }
        }

        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR"]
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }

    private func parseWithoutRegex(from text: String, imageData: Data?) -> ReceiptsModel {
        let lines = text.components(separatedBy: .newlines)

        var store = "장소 없음"
        var purchasedAt = "날짜 없음"
        var totalAmount = 0

        var i = 0

        print("===== OCR 디버그 시작 =====")

        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("🔹 [\(i)] \(trimmed)")

            // 장소
            if store == "장소 없음", trimmed.contains("점") {
                store = "스타벅스 " + trimmed
            }
            
            if purchasedAt == "날짜 없음" {
                if trimmed.contains("-"),
                   trimmed.contains(":"),
                   trimmed.count >= 17 {
                    var dateTimeString: String? = nil
                    
                    if trimmed.contains(" ") {
                        let components = trimmed.components(separatedBy: .whitespaces)
                        if components.count >= 2,
                           components[0].contains("-"),
                           components[1].contains(":") {
                            dateTimeString = "\(components[0]) \(components[1])"
                        }
                    } else if trimmed.count >= 18 {
                        // 공백 없는 경우
                        let datePart = String(trimmed.prefix(10))
                        let timePart = String(trimmed.suffix(8))
                        dateTimeString = "\(datePart) \(timePart)"
                    }
                    
                    if let dt = dateTimeString,
                       let formatted = formatDateString(dt) {
                        purchasedAt = formatted
                    }
                }
            }

            
            // 결제 금액
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                }
            }

            i += 1
        }

        print("===== OCR 디버그 끝 =====")
        print("🏪 매장명: \(store)")
        print("⏱️ 결제 날짜: \(purchasedAt)")
        print("💰 결제 금액: \(totalAmount)")

        return ReceiptsModel(
            store: store,
            purchasedAt: purchasedAt,
            totalAmount: totalAmount,
            imageData: imageData!
        )
    }
    
    private func formatDateString(_ input: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        inputFormatter.locale = Locale(identifier: "ko_KR")
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy.MM.dd HH:mm"
        outputFormatter.locale = Locale(identifier: "ko_KR")
        
        if let date = inputFormatter.date(from: input) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    // 미리보기용
    func startOCR(_ segment: ReceiptSegment) {
        if let uiImage = UIImage(named: segment.imageName) {
            startOCR(uiImage) 
        }
    }
}

