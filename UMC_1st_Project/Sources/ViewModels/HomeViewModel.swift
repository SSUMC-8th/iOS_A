//
//  HomeViewModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/30/25.
//

import Foundation
import SwiftUI


@Observable
class HomeViewModel {
    var coffees = [
        Menu(imageName: "에스프레소 콘파나"),
        Menu(imageName: "에스프레소 마키아또"),
        Menu(imageName: "아이스 카페 아메리카노"),
        Menu(imageName: "카페 아메리카노"),
        Menu(imageName: "아이스 카라멜 마키아또"),
        Menu(imageName: "카라멜 마키아또")
    ]
    
    var whatsnews = [
        Menu(imageName: "whatsnew_1"),
        Menu(imageName: "whatsnew_2"),
        Menu(imageName: "whatsnew_3")
    ]
    
    var dessert = [
        Menu(imageName: "너티 크루아상"),
        Menu(imageName: "매콤 소시지 불고기"),
        Menu(imageName: "미니 리프 파이"),
        Menu(imageName: "뺑 오 쇼콜라"),
        Menu(imageName: "소시지&올리브 파이")
    ]
    
}
     
     

