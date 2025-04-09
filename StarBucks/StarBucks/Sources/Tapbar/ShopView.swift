import SwiftUI

// 메인 ShopView: 전체 뷰를 스크롤뷰와 VStack으로 감쌌습니다.
struct ShopView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ShopWhatsNewBannersView()
                ShopAllProductsView()
                ShopBestItemsView()
                ShopNewProductsView()
            }
        }
    }
}

// 신규 배너 뷰
struct ShopWhatsNewBannersView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Starbucks Online Store")
                .font(.PretendardBold24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(1..<4) { index in
                        Image("shop banner\(index)")
                            .resizable()
                            .frame(width: 270, height: 216)
                            .padding(.horizontal)
                    }
                }
            }
            .frame(height: 216)
        }
    }
}

// 전체 상품 뷰
struct ShopAllProductsView: View {
    let productsText: [String] = ["텀블러", "커피 용품", "선물세트", "보온병", "머그/컵", "라이프스타일"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Products")
                .font(.PretendardBold20)//22로 수정
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(1..<7) { index in
                        ShopProductCard(imageName: "All Product\(index)", text: productsText[index-1])
                    }
                }
            }
            .frame(height: 108)
        }
    }
}

// All Products용 카드 뷰
struct ShopProductCard: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
            Text(text)
                .font(.PretendardSemibold14) //13으로 수정
        }
    }
}

// 베스트 상품 뷰 (탭뷰 형태)
struct ShopBestItemsView: View {
    // 각 페이지별 상품 설명 텍스트 배열 (2페이지 기준)
    let columnText = [
        ["그린 사이렌 슬리브 머그 \n355ml", "그린 사이렌 클래식 머그 \n355ml", "사이렌 머그 앤 우드 소서", "리저브 골드 테일 머그 \n355ml"],
        ["블랙 앤 골드 머그 473ml", "블랙 링 머그 355ml", "북청사자놀음 데미머그 \n89ml", "서울 제주 데미머그 세트"]
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 65),
        GridItem(.flexible(), spacing: 65)
    ]
    
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            Text("Best Items")
                .font(.PretendardBold20)//22로 수정
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TabView(selection: $currentPage) {
                ForEach(0..<2, id: \.self) { pageIndex in
                    VStack(alignment: .leading) {
                        LazyVGrid(columns: columns) {
                            ForEach(1..<5) { i in
                                // 현재 페이지의 텍스트 배열을 사용
                                SquareProductCard(imageName: "Best Items\(i)", text: columnText[currentPage][i-1])
                            }
                        }
                    }
                    .tag(pageIndex)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 470)
            .padding()
            
            // 페이지 인디케이터
            HStack(spacing: 8) {
                ForEach(0..<2, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color.black : Color.white)
                        .stroke(Color.black, lineWidth: 0.5)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 8)
        }
    }
}

// 신규 상품 뷰
struct ShopNewProductsView: View {
    let columnText = ["그린 사이렌 도트 머그 \n237ml", "그린 사이렌 도트 머그 \n355ml", "홈 카페 미니 머그 세트", "홈 카페 글라스 세트"]
    
    let columns = [
        GridItem(.flexible(), spacing: 65),
        GridItem(.flexible(), spacing: 65)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Products")
                .font(.PretendardBold20)//22로 수정
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            LazyVGrid(columns: columns) {
                ForEach(1..<5) { i in
                    SquareProductCard(imageName: "New Products\(i)", text: columnText[i-1])
                }
            }
        }
    }
}

// 공용 상품 카드 뷰 (ShopNewProductsView와 ShopBestItemsView에서 사용)
struct SquareProductCard: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            Text(text)
                .font(.PretendardSemibold14)//13으로 수정
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

// 프리뷰
struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
