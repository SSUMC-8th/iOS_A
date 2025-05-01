import Foundation

struct ShopModel: Identifiable, Hashable {
    let id = UUID()
    var imageName: String
    var info: String
}

