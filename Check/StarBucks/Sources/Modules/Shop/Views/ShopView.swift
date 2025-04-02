//
//  ShopView.swift
//  StarBucks
//
//  Created by LEE on 3/25/25.
//

import SwiftUI

struct ShopView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    init(container: DIContainer) {
        
    }

    var body: some View {
        Text("ShopView")
    }
}

