import SwiftUI
import MapKit

struct MapView: View {
    
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var viewModel: MapViewModel = .init()
    
    var body: some View {
        
        Map(position: $viewModel.cameraPosition) {
            ForEach(viewModel.makers, id: \.id, content: { marker in
                Annotation(marker.title, coordinate: marker.coordinate, content: {
                    Image(systemName: "mappin.circle.fill")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.red)
                })
            })
        }
    }
}

#Preview {
    MapView()
}
