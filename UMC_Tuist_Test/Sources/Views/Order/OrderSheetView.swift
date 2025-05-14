import SwiftUI
import CoreLocation

struct OrderSheetView: View {
    @State var searchText: String = ""
    @State private var isNearbyStore = true
    @State private var selectedMap = false
    @State var JPviewModel: JSONParsingViewModel = .init()
    @Bindable private var viewModel: MapViewModel = .init()
    @StateObject private var locationManager = LocationManager.shared

    @State private var address: String = "주소를 불러오는 중..."
    @State private var distance: Double? = nil
    
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
                        if locationManager.currentLocation == nil {
                            Text("현재 위치를 불러오는 중입니다...")
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else if sortedFeatures.isEmpty {
                            Text("근처 매장을 찾을 수 없습니다.")
                                .frame(maxWidth: .infinity, alignment: .center)
                        } else{
                            ForEach(sortedFeatures) { store in
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
                                            ForEach(store.properties.storeTypes, id: \.self) { type in
                                                switch type {
                                                case .reserve:
                                                    Image("R")
                                                case .driveThru:
                                                    Image("D")
                                                case .none:
                                                    EmptyView()
                                                }
                                            }
                                            Spacer()
                                            
                                        }
                                    }
                                }
                            }}
                    } else {
                        Text("...")
                    }
                }
                .padding()
            }
        }
    }
    
    private var sortedFeatures: [Feature] {
        guard let features = JPviewModel.stores?.features,
              let currentLocation = locationManager.currentLocation else {
            return []
        }
        
        return features.sorted {
            let loc1 = CLLocation(latitude: $0.geometry.location.latitude, longitude: $0.geometry.location.longitude)
            let loc2 = CLLocation(latitude: $1.geometry.location.latitude, longitude: $1.geometry.location.longitude)
            
            return currentLocation.distance(from: loc1) < currentLocation.distance(from: loc2)
        }
    }
}

#Preview {
    OrderSheetView()
}

