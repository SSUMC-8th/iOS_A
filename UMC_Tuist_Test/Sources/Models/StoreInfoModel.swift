import Foundation

enum StoreInfoSegmentType: String, CaseIterable, Identifiable {
    case SearchStore = "매장 찾기"
    case Diresctions = "길 찾기"
    
    var id: String {rawValue}
}
