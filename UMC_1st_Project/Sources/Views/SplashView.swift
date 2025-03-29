//
//  SplashView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/22/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            
            
            Color("green01")
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Image("StarbucksLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 168, height: 168)
                
        }
    }
}

#Preview {
    SplashView()
}

