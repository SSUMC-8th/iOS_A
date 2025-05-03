//
//  StoreSearchView.swift
//  StarBucks
//
//  Created by LEE on 5/3/25.
//

import SwiftUI

struct StoreSearchView: View {
    
    @EnvironmentObject var container: DIContainer
    @State var viewModel: OrderSheetViewModel = .init()
    
    init(container: DIContainer) {
        
    }
    
    var body: some View {
        VStack {
            navigationBar(left: container.navigationRouter.popToRootView)
                .border(.green)
            
            Spacer()
            
            MapView(starbucksList: $viewModel.starBucksList)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func navigationBar(left: @escaping () -> Void) -> some View {
        
        ZStack(alignment: .center) {
            HStack {
                
                Button(action: left, label: {
                    
                    Image(systemName: "chevron.backward")
                        .tint(Color.black)
                })
                Spacer()

            }
            .padding(.horizontal, 10)
            
            Text("매장 찾기")
                .font(.mainTextMedium16)
                .foregroundStyle(.black)
            
            Spacer()
        
            
        }
        .frame(height: 70)
        .background(.white)
    }
}


