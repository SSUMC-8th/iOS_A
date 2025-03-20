//
//  SplashView.swift
//  StarBucks
//
//  Created by LEE on 3/17/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        ZStack(alignment: .center) {
            Icon.starbucks.image
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green01)
        
    }
}

#Preview {
    SplashView()
}
