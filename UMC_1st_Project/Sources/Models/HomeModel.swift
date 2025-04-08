//
//  HomeModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/1/25.
//

import Foundation
import SwiftUI

struct Menu: Identifiable, Hashable {
    let id = UUID()
    var imageName: String
    var coffeeType: CoffeeType? /// 커피 타입 추가

        init(imageName: String, coffeeType: CoffeeType? = nil) {
            self.imageName = imageName
            self.coffeeType = coffeeType
        }
}
