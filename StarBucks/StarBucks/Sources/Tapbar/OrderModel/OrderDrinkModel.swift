//
//  OrderDrinkView.swift
//  StarBucks
//
//  Created by 한태빈 on 5/1/25.
//


import SwiftUI

struct OrderDrink: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
    let imageName: String
    let dot:Bool
}
