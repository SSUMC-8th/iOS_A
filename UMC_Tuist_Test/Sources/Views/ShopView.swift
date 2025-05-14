import SwiftUI

struct ShopView: View {
    @State private var ShopViewModel: ShopViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack {
                StarbucksOnlineStore
                Spacer()
                AllProducts
                Spacer()
                BestItems
                Spacer()
                NewProducts
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 67)
        }
        .ignoresSafeArea(.all)
        .background(Color.white01)
    }
    
    private var StarbucksOnlineStore: some View {
        VStack {
            HStack {
                Text("Starbucks Online Store")
                    .font(.mainTextBold24)
                Spacer()
            }
            
            Spacer().frame(height: 16)
            
            ScrollView (.horizontal){
                LazyHStack (spacing: 28){
                    Image("onlinestore1")
                    Image("onlinestore2")
                    Image("onlinestore3")
                }
            }
        }
    }
    
    private var AllProducts: some View {
        VStack {
            HStack {
                Text("All Products")
                    .font(.mainTextBold22)
                Spacer()
            }
            
            Spacer().frame(height: 16)
            
            ScrollView (.horizontal) {
                LazyHStack (spacing: 17) {
                    ForEach(ShopViewModel.All, id: \.self) { product in
                        AllImageCard(Name: product.imageName, Info: product.info)
                    }
                }
            }
        }
    }
    
    private func AllImageCard(Name: String, Info: String) -> some View {
        VStack {
            Image(Name)
                .resizable()
                .frame(width: 80, height: 80)
            Text(Info)
                .font(.mainTextSemiBold13)
        }
    }
    
    private var BestItems: some View {
        VStack {
            HStack {
                Text("Best Items")
                    .font(.mainTextBold22)
                Spacer()
            }
            
            Spacer().frame(height: 16)
            
            TabView {
                ForEach(1..<ShopViewModel.Best.count/4 + 1) { index in //페이지
                    ItemPage(type: ShopViewModel.Best ,page: index)
                }
            }
            .padding(.horizontal, 14)
            .tabViewStyle(.page)
            .frame(width: 408, height: 470)
        }
    }
    
    private func ItemPage(type: [ShopModel] ,page: Int) -> some View {
        let itemPerPage = 4
        let start = (page - 1) * itemPerPage
        let end = min(start + itemPerPage, type.count)
        let items = Array(type[start..<end])
        let columns = [
            GridItem(.flexible(), spacing: 65),
            GridItem(.flexible(), spacing: 65)
        ]
        
        return VStack {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(items, id: \.self) { item in
                    ItemImageCard(Name: item.imageName, Info: item.info)
                }
            }
        }
    }
    
    private func ItemImageCard(Name: String, Info: String) -> some View {
        VStack {
            Image(Name)
                .resizable()
                .frame(width: 157, height: 156)
            
            Spacer()
            
            Text(Info)
                .font(.mainTextSemiBold14)
        }
        .frame(width: 157, height: 208)
    }
    
    private var NewProducts: some View {
        VStack {
            HStack {
                Text("New Products")
                    .font(.mainTextBold22)
                Spacer()
            }
            
            Spacer().frame(height: 16)
            
            ItemPage(type: ShopViewModel.New, page: 1)
                .padding(.horizontal, 14)
        }
    }
}

#Preview {
    ShopView()
}
