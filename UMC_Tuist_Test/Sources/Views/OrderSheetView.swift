import SwiftUI

struct OrderSheetView: View {
    @State var searchText: String = ""
    @State private var isNearbyStore = true
    @State private var selectedMap = false
    @State var JPviewModel: JSONParsingViewModel = .init()
    @Bindable private var viewModel: MapViewModel = .init()
    @Bindable private var locationManager: LocationManager = .shared
    
    var body: some View {
        VStack {
            ZStack {
                Text("매장 설정")
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(Color.black03)
                HStack {
                    Spacer()
                    Button(action: {
                        selectedMap.toggle()
                    }) {
                        Image(selectedMap ? "list" : "Vector")
                    }
                }
            }
            .frame(width: 375, height: 19)
            
            Spacer().frame(height: 24)
            
            TextField("검색", text: $searchText, onCommit: {
                if let location = locationManager.currentLocation {
                    viewModel.search(query: searchText, to: location)
                }
            })
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .frame(width: 375, height: 27)
                .cornerRadius(5)
            
            Spacer().frame(height: 22)
            
            HStack(spacing: 10) {
                Button(action: {
                    isNearbyStore = true
                }) {
                    Text("가까운 매장")
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(isNearbyStore ? Color.black : Color.gray03)
                }
                Text("|")
                    .foregroundStyle(Color.gray03)
                Button(action: {
                    isNearbyStore = false
                }) {
                    Text("자주 가는 매장")
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(!isNearbyStore ? Color.black : Color.gray03)
                }
                Spacer()
            }
            .frame(width: 375)
            
            Spacer().frame(height: 17)
            Divider()
                .frame(width: 375)
            Spacer().frame(height: 0)
            
            if isNearbyStore && !selectedMap {
                NearbyStore
            } else if isNearbyStore && selectedMap {
                MapView()
            } else {
                Text("자주 가는 매장")
            }
        }
        .padding(.top, 24)
        .onAppear {
            JPviewModel.loadMyProfile { result in
                switch result {
                case .success:
                    print("성공적으로 불러옴")
                case .failure(let error):
                    print("에러 발생: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private var NearbyStore: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if let features = JPviewModel.stores?.features {
                        ForEach(features) { store in
                            HStack {
                                Image(systemName: "photo")
                                    .frame(width: 83, height: 83)
                                    .cornerRadius(6)
                                
                                Spacer().frame(width: 16)
                                
                                VStack {
                                    HStack {
                                        Text(store.properties.Sotre_nm)
                                            .font(.headline)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(store.properties.Address)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                    HStack {
                                        
                                    }
                                }
                            }
                        }
                    } else {
                        Text("...")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    OrderSheetView()
}

