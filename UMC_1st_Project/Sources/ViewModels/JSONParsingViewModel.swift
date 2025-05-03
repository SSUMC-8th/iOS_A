//
//  JSONParsingViewModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/30/25.
//

import Foundation

@Observable
class JSONParsingViewModel {
    var storeData: Store?
    
    func loadStoredata(completion: @escaping (Result<Store, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "스타벅스_2025 데이터", withExtension: "json") else {
            print("json 파일 없음")
            completion(.failure(NSError(domain: "파일 못찾아요!", code: 404, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(Store.self, from: data)
            self.storeData = decoded
            print("디코딩 성공")
            completion(.success(decoded))
        } catch {
            print("디코딩 실패: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }
}
