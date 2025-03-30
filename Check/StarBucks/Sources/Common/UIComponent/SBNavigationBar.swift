//
//  SBNavigationBar.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import SwiftUI

struct SBNavigationBar: View {
    
    let type: BarType
    let action: () -> Void
    let icon: Image
    
    init(type: BarType, icon: Image =                     Image(systemName: "chevron.left")
, action: @escaping () -> Void) {
        self.type = type
        self.icon = icon 
        self.action = action
    }
    
    var body: some View {
        HStack {
            if type == .leftBack {
                Button(action: action, label: {
                    icon
                        .foregroundStyle(.black)
                })
                
                Spacer()
                
                Text("가입하기")
                    .padding(.trailing, 20)
                
                Spacer()
                
            } else {
                Spacer()
                Button(action: action, label: {
                    icon
                })
            }
        }
        .frame(height: 70)
        .background(.white)
    }
    
    enum BarType {
        case leftBack
        case rightButton
    }
}


