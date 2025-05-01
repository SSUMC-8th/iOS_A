import Foundation

@Observable
class JSONParsingViewModel {
    var stores: FeatureCollection?
    
    func loadMyProfile(completion: @escaping (Result<FeatureCollection, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "스타벅스_2025 데이터", withExtension: "geojson") else {
            print("파일 없음")
            completion(.failure(NSError(domain: "파일 못찾아요!", code: 404, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(FeatureCollection.self, from: data)
            self.stores = decoded
            print("디코딩 성공")
            completion(.success(decoded))
        } catch {
            print("디코딩 실패: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }
}

