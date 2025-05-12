//
//  OrderSegmentControl.swift
//  StarBucks
//
//  Created by LEE on 5/1/25.
//

import SwiftUI

struct OrderSegmentControl<T: CaseIterable & SegmentProtocol>: View {
    
    @Binding var selectedSegment: T
    @Namespace var name
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack(spacing: 14, content: {
                ForEach(Array(T.allCases), id: \.self) { segment in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedSegment = segment
                        }
                    }, label: {
                        
                        if segment.isButton {
                            makeButton(segment: segment)
                        } else {
                            makeSegment(segment: segment)
                        }
                        
                    })
                }
            })
            .zIndex(1)

        }
    }
    
    private func makeSegment(segment: T) -> some View {
        VStack(alignment: .center, spacing: 13, content: {
            Text(segment.segmentTitle)
                .font(.mainTextBold16)
                .foregroundStyle(selectedSegment == segment ? Color.black01 : Color.gray04)
                .frame(height: 24)
                .background(
                    GeometryReader { geo in
                        Color.clear
                    }
                )
            
            if selectedSegment == segment {

                Capsule()
                    .fill(Color.green01)
                    .frame(width: 120, height: 3)
                    .matchedGeometryEffect(id: "Tab", in: name)
    
            } else {
                Capsule()
                    .fill(Color.clear)
                    .frame(width: 120, height: 3)
                    .shadow(color: Color.black, radius: 3)
            }
        })

    }
    
    private func makeButton(segment: T) -> some View {
        
        VStack(alignment: .center, spacing: 13, content: {
            HStack {
                segment.image!

                Text(segment.segmentTitle)
                    .font(.mainTextBold16)
                    .foregroundStyle(Color.green01)
                    .frame(height: 24)
                    .background(
                        GeometryReader { geo in
                            Color.clear
                        }
                    )
                
            }
            

            if selectedSegment == segment {

                Capsule()
                    .fill(Color.green01)
                    .frame(width: 120, height: 3)
                    .matchedGeometryEffect(id: "Tab", in: name)
            } else {
                Capsule()
                    .fill(Color.clear)
                    .frame(width: 120, height: 3)
                
            }
        })

    }
}
