import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.green01.edgesIgnoringSafeArea(.all)
            Image(.starbucsLogo)
                .resizable()
                .frame(width: 168, height: 168)
            
        }
    }
}

#Preview {
    SplashView()
}

