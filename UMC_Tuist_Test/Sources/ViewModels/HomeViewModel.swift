//
//  HomeViewModel.swift
//  UMC_Tuist_Test
//
//  Created by 홍지우 on 3/29/25.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
//    var MenuImg = [
//        HomeModel(imageName: "에스프레소 콘파나"),
//        HomeModel(imageName: "에스프레소 마키아또"),
//        HomeModel(imageName: "아이스 카페 아메리카노"),
//        HomeModel(imageName: "카페 아메리카노"),
//        HomeModel(imageName: "아이스 카라멜 마키아또"),
//        HomeModel(imageName: "카라멜 마키아또")
//    ]
    
    var CopyImg = [
        HomeModel(imageName: "copy1"),
        HomeModel(imageName: "copy2"),
        HomeModel(imageName: "copy3")
    ]
    
    var DessertImg = [
        HomeModel(imageName: "크루아상"),
        HomeModel(imageName: "소시지 불고기"),
        HomeModel(imageName: "미니 리프 파이"),
        HomeModel(imageName: "빵 오 쇼콜라"),
        HomeModel(imageName: "소시지")
    ]
    
    var selectedCoffeeModel : CoffeeInfoModel?
}
