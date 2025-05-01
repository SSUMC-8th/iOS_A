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
    case trash = "trash"
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
    case beverage_banner = "beverage_banner"
    case online_banner = "online_banner"
    case delivery_banner = "delivery_banner"
    
    case coffee_americano = "coffee_americano"
    case coffee_caramel = "coffee_caramel"
    case coffee_contana = "coffee_contana"
    case coffee_espresso = "coffee_espresso"
    case coffee_ice_americano = "coffee_ice_americano"
    case coffee_ice_caramel = "coffee_ice_caramel"

    
    case recycle = "recycle"
    case find_starbucks = "find_starbucks"
    case reserve_spring = "reserve_spring"
    case mini_leaf_pie = "mini_leaf_pie"
    case nutty_croissant = "nutty_croissant"
    case pain_au_chocolat = "pain_au_chocolat"
    case sausage_olive_pie = "sausage_olive_pie"
    case spicy_sausage_bulgogi = "spicy_sausage_bulgogi"
    
    
    // MARK: - CoffeeDetail
    case cafe_americano = "cafe_americano"
    case caramel_macchiato = "caramel_macchiato"
    case espresso_conpana = "espresso_conpana"
    case espresso_macchiato = "espresso_macchiato"
    case ice_cafe_americano = "ice_cafe_americano"
    case ice_caramel_macchiato = "ice_caramel_macchiato"
    case new = "new"
    case back = "back"
    case share = "share"
    
    // MARK: - Shop
    case coffee_product = "coffee_product"
    case gift_product = "gift_product"
    case lifestyle_product = "lifestyle_product"
    case mug_product = "mug_product"
    case thermos_product = "thermos_product"
    case tumblur_product = "tumblur_product"
    case best1 = "best1"
    case best2 = "best2"
    case best3 = "best3"
    case best4 = "best4"
    case best5 = "best5"
    case best6 = "best6"
    case best7 = "best7"
    case best8 = "best8"
    case new1 = "new1"
    case new2 = "new2"
    case new3 = "new3"
    case new4 = "new4"
    case store1 = "store1"
    case store2 = "store2"
    case store3 = "store3"
    
    // MARK: - Order
    case cake = "cake"
    case ice_caramel_macchiato_order = "ice_caramel_macchiato_order"
    case caramel_macchiato_order = "caramel_macchiato_order"
    case ice_cafuchino_order = "ice_cafuchino_order"
    case cafuchino_order = "cafuchino_order"
    case cafe_americano_order = "cafe_americano_order"
    case ice_cafe_americano_order = "ice_cafe_americano_order"
    case recommend_order = "recommend_order"
    case affogato_order = "affogato_order"
    case bottled_beverage_order = "bottled_beverage_order"
    case lavender_cafe_breve_order = "lavender_cafe_breve_order"
    case rumshot_cortado_order = "rumshot_cortado_order"
    
    var image: Image {
        return Image(self.rawValue)
    }
    
}
