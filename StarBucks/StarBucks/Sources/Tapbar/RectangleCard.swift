//
//  RectangleCard.swift
//  StarBucks
//
//  Created by 한태빈 on 4/9/25.
//

import SwiftUI

struct SquareCard: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 157, height: 156)
                .cornerRadius(5)
                .aspectRatio(contentMode: .fit)
            
            Spacer().frame(height: 12)
            
            Text(text)
                .font(.PretendardSemibold14)
                .frame(width: 157, alignment:.leading)
        }
        
    }
}
