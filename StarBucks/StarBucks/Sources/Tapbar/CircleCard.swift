//
//  CircleCard.swift
//  StarBucks
//
//  Created by 한태빈 on 4/9/25.
//

import SwiftUI

struct CircleCard: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
            
            Text(text)
                .font(.PretendardSemibold14)//13으로
        }
        
    }
}

#Preview {
}
