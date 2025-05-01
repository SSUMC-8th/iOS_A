import Foundation
import SwiftUI

@Observable
class ShopViewModel {
    
    var All = [
        ShopModel(imageName: "product1", info: "텀블러"),
        ShopModel(imageName: "product2", info: "커피 용품"),
        ShopModel(imageName: "product3", info: "선물세트"),
        ShopModel(imageName: "product4", info: "보온병"),
        ShopModel(imageName: "product5", info: "머그/컵"),
        ShopModel(imageName: "product6", info: "라이프스타일")
    ]
    
    var Best = [
        ShopModel(imageName: "best1", info: "그린 사이렌 슬리브 머그\n355ml"),
        ShopModel(imageName: "best2", info: "그린 사이렌 클래식 머그\n355ml"),
        ShopModel(imageName: "best3", info: "사이렌 머그 앤 우드 소서"),
        ShopModel(imageName: "best4", info: "리저브 골드 테일 머그\n355ml"),
        ShopModel(imageName: "best5", info: "블랙 앤 골드 머그 473ml"),
        ShopModel(imageName: "best6", info: "블랙 링 머그 355ml"),
        ShopModel(imageName: "best7", info: "북청사자놀음 데미머그 89ml"),
        ShopModel(imageName: "best8", info: "서울 제주 데미머그 세트")
    ]
    
    var New = [
        ShopModel(imageName: "new1", info: "그린 사이렌 도트 머그 237ml"),
        ShopModel(imageName: "new2", info: "그린 사이렌 도트 머그 355ml"),
        ShopModel(imageName: "new3", info: "홈 카페 미니 머그 세트"),
        ShopModel(imageName: "new4", info: "홈 카페 글라스 세트")
    ]
}
