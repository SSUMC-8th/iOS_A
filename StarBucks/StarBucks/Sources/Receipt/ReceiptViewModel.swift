import SwiftUI
import Vision
import Foundation

class ReceiptViewModel: ObservableObject {
    @Published var receipts: [ReceiptModel] = []
    
    func startOCR(with image: UIImage) {
        guard let cgImage = image.cgImage,
              let imageData = image.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                return
            }
            
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")
            let parsed = self.parseWithoutRegex(from: fullText, imageData: imageData)
            
            DispatchQueue.main.async {
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
    
    // OCR 텍스트를 파싱하여 ReceiptModel 객체를 생성합니다.
    private func parseWithoutRegex(from text: String, imageData: Data) -> ReceiptModel {
        let lines = text.components(separatedBy: .newlines)
        
        var store = "장소 없음"
        var time = "날짜 없음"
        var totalPrice = 0
        
        var i = 0
        
        print("===== OCR 디버그 시작 =====")
        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("🔹 [\(i)] \(trimmed)")
            
            // 매장명: "점"이 포함되면 매장 정보 설정 (예: "스타벅스 강남점")
            if store == "장소 없음", trimmed.contains("점") {
                store = "스타벅스 " + trimmed
            }
            
            // 결제 금액: "결제금액" 라는 키워드가 있는 경우, 2줄 아래의 숫자를 추출
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalPrice = amount
                }
            }
            
            // 결제 시간: "2025" 등이 포함된 줄을 기준으로 2줄 아래의 문자열을 사용
            if trimmed.contains("2025"), i + 2 < lines.count {
                let timeLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                time = timeLine
            }
            
            i += 1
        }
        
        print("===== OCR 디버그 끝 =====")
        print("🏪 매장명: \(store)")
        print("🕒 결제시간: \(time)")
        print("💰 총 금액: \(totalPrice)")
        
        return ReceiptModel(
            store: store,
            totalPrice: totalPrice,
            imageData: imageData,
            createdAt: Date(),
            time: time
        )
    }
}
