import SwiftUI

struct TabbarView: View {
    @State private var selectedIndex: Int = 0
    
    private let tabNames = ["home", "pay", "order", "shop", "other"]
    private let topBarTitles = ["Home", "Pay", "Order", "Shop", "Other"]
    
    var body: some View {
        VStack(spacing: 0) {
            TopBarView(
                title: topBarTitles[selectedIndex],
                showExit: selectedIndex == 4  
            )
            
            ZStack {
                selectedView(for: selectedIndex)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            tabBar
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    private func selectedView(for index: Int) -> some View {
        switch index {
        case 0:
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        case 1:
            NavigationView {
                PayView()
                    .navigationBarHidden(true)
            }
        case 2:
            NavigationView {
                OrderView()
                    .navigationBarHidden(true)
            }
        case 3:
            NavigationView {
                ShopView()
                    .navigationBarHidden(true)
            }
        case 4:
            NavigationView {
                OtherView()
                    .navigationBarHidden(true)
            }
        default:
            HomeView()
        }
    }
    
    /// 탭바 영역
    private var tabBar: some View {
        HStack(spacing: 44) {
            ForEach(0..<tabNames.count, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    Image(selectedIndex == index ? "\(tabNames[index])green" : tabNames[index])
                        .padding(.top, 15)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(height: 83)
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

struct TopBarView: View {
    @EnvironmentObject var router: NavigationRouter
    var title: String
    var showExit: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.PretendardBold24)
                .padding(.leading, 23.5)
            Spacer()
            if showExit {
                Button(action: {
                    router.isLoggedIn = false
                }) {
                    Image("exit")
                        .padding(.trailing, 23.5)
                }
            }
        }
        .frame(height: 80)
        .background(Color.white)
    }
}

#Preview {
    TabbarView().environmentObject(NavigationRouter())
}
