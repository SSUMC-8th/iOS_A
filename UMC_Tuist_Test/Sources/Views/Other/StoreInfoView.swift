import SwiftUI

struct StoreInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var InfoSegment: StoreInfoSegmentType = .SearchStore
    @Namespace var name
    
    var body: some View {
        VStack(spacing: 17) {
            Spacer().frame(height: 38)
            
            ZStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("blackback")
                            .foregroundColor(Color.black)
                            .frame(width: 24, height: 24)
                    })
                    
                    Spacer()
                }
                .padding(.horizontal, 33)
                
                Text("매장 찾기")
                    .font(.mainTextSemiBold16)
            }
            
            HStack {
                ForEach(StoreInfoSegmentType.allCases) { segment in
                    Button(action: {
                        InfoSegment = segment
                    }) {
                        VStack {
                            Text(segment.rawValue)
                                .font(.mainTextSemiBold24)
                                .foregroundStyle(Color.black)
                            
                            if InfoSegment == segment {
                                Capsule()
                                    .fill(Color.brown02)
                                    .frame(height: 3)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            } else {
                                Color.clear.frame(height: 3)
                            }
                        }
                        .frame(width: 120)
                    }
                }
            }
            ZStack {
                Spacer().frame(height: 6)
                
                switch InfoSegment {
                case .SearchStore:
                    MapView()
                case .Diresctions:
                    Text("길 찾기")
                }
            }
        }
        .padding(.top, 16)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    StoreInfoView()
}
