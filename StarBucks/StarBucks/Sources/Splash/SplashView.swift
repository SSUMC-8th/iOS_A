import SwiftUI


struct SplashView: View {
    var body: some View {

        ZStack(alignment: .center) {
            Color("StarBucksGreen").edgesIgnoringSafeArea(.all)
            Image(.starbucklogo)
                .resizable()
                .frame(width: 168, height: 168)
        }

    }
}


#Preview {
    SplashView()
}
