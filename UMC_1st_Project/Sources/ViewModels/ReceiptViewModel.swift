//
//  ReceiptViewModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/8/25.
//

import Foundation
import SwiftUI
import Vision
import SwiftData

//@Observable
class ReceiptViewModel: ObservableObject, ImageHandling {
    var images: [UIImage] = []
    var recognizedText: String = ""
    var isImagePickerPresented: Bool = false
    var isCameraPresented: Bool = false
    var isDialogPresented: Bool = false
    var receipts: [Receipt] = []
    
    private var context: ModelContext?

       init() {}

       func setContext(_ context: ModelContext) {
           self.context = context
       }

    func addImage(_ images: UIImage) {
        self.images.append(images)
        performOCR(on: images)
    }
    
    func removeImage(at index: Int) {
        guard !images.isEmpty else { return }
        images.remove(at: index)
    }
    
    func getImages() -> [UIImage] {
        images
    }
    
    //var isImagePickerPresented: Bool = false
    
    private func performOCR(on uiImage: UIImage) {
            guard let cgImage = uiImage.cgImage else { return }

            let request = VNRecognizeTextRequest { [weak self] request, error in
                
                guard let self = self else { return }
                
                guard let results = request.results as? [VNRecognizedTextObservation] else { return }
                let recognizedStrings = results.compactMap { $0.topCandidates(1).first?.string }
                let combinedText = recognizedStrings.joined(separator: "\n")
                
                DispatchQueue.main.async {
                                self.recognizedText = combinedText
                                let parsed = self.parseReceiptInfo(from: combinedText)

                                let newReceipt = Receipt(
                                    storeName: parsed.store,
                                    date: parsed.date ?? Date(),
                                    totalAmount: parsed.totalAmount,
                                    imageData: uiImage.jpegData(compressionQuality: 0.8)
                                )

                                self.receipts.append(newReceipt)

                                do {
                                    if let context = self.context {
                                        context.insert(newReceipt)
                                        try context.save()
                                    } else {
                                        print("context 없음")
                                    }
                                } catch {
                                    print("SwiftData 저장 실패: \(error.localizedDescription)")
                                }
                            }
                
                                
                /*
                DispatchQueue.main.async {
                    self?.recognizedText = recognizedStrings.joined(separator: "\n")
                }*/
            }

            request.recognitionLevel = .accurate as VNRequestTextRecognitionLevel
            request.usesLanguageCorrection = true
            request.recognitionLanguages = ["ko-KR", "en-US"]

            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])

            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    try handler.perform([request])
                } catch {
                    print("OCR 실패: \(error.localizedDescription)")
                }
            }
        
        
        
        
        }
    
    private func parseReceiptInfo(from text: String) -> (store: String, date: Date?, totalAmount: Int) {
        let lines = text.components(separatedBy: .newlines)
        var store = "장소 없음"
        var totalAmount = 0
        var date: Date? = nil

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        for i in 0..<lines.count {
            let line = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)

            // 지점명 추출
            if store == "장소 없음", line.contains("점") {
                //store = "스타벅스 " + line
                store = line
            }

            // 날짜 추출
            if date == nil {
                if let match = line.range(of: #"\d{4}\.\d{2}\.\d{2}"#, options: .regularExpression) {
                    let dateString = String(line[match])
                    date = dateFormatter.date(from: dateString)
                }
            }

            // 결제 금액 추출
            if line.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                }
            }
        }

        print("지점: \(store)")
        print("날짜: \(date?.description ?? "날짜 없음")")
        print("총 가격: \(totalAmount)")

        return (store, date, totalAmount)
    }

}


extension ReceiptViewModel {
    static func preview() -> ReceiptViewModel {
        let viewModel = ReceiptViewModel()
        viewModel.receipts = [
            Receipt(storeName: "강남점", date: Date(), totalAmount: 5500, imageData: nil),
            Receipt(storeName: "신촌점", date: Date(), totalAmount: 6200, imageData: nil)
        ]
        return viewModel
    }
}
