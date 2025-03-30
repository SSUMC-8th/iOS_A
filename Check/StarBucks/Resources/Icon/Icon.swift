//
//  Icon.swift
//  StarBucks
//
//  Created by LEE on 3/17/25.
//

import SwiftUI

enum Icon: String {
    
    // MARK: - Splash
    case starbucks = "starbucks"
    
    // MARK: - Login
    case apple_login = "apple_login"
    case kakao_login = "kakao_login"
    case ad_image = "ad_image"
    
    // MARK: - Other
    case logout = "logout"
    case own_menu = "own_menu"
    case star = "star"
    case receipt = "receipt"
    case card_change = "card_change"
    case coupon_history = "coupon_history"
    case coupon = "coupon"
    case return_info = "return_info"
    case starbucks_card = "starbucks_card"
    case store_care = "store_care"
    case store_info = "store_info"
    case my_review = "my_review"
    case customer = "customer"
    
    // MARK: - Tab
    case home = "home"
    case pay = "pay"
    case order = "order"
    case shop = "shop"
    case other = "other"
    case home_selected = "home_selected"
    case pay_selected = "pay_selected"
    case order_selected = "order_selected"
    case shop_selected = "shop_selected"
    case other_selected = "other_selected"
    
    // MARK: - Home
    case top_banner = "top_banner"
    case ad_banner = "ad_banner"
    case coldbrew_banner = "coldbrew_banner"
    case event_banner = "event_banner"
    case mug_banner = "mug_banner"
    case starbucks_banner = "starbucks_banner"
    case subscribe_banner = "subscribe_banner"
    case coffee_americano = "coffee_americano"
    case coffee_caramel = "coffee_caramel"
    case coffee_contana = "coffee_contana"
    case coffee_espresso = "coffee_espresso"
    case coffee_ice_americano = "coffee_ice_americano"
    case coffee_ice_caramel = "coffee_ice_caramel"
    
    var image: Image {
        return Image(self.rawValue)
    }
    
}
