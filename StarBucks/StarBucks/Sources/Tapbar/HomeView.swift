import SwiftUI

struct HomeView: View {
    private let model = HomeModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                topBanner
                bannerSection1
                recommendedSection
                bannerSection2
                whatsNewSection
                bannerSection3
                dessertSection
                bannerSection4
            }
        }
    }
    
    private var topBanner: some View {
        GeometryReader { geometry in
            Image("topBanner")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width,
                       height: geometry.size.width * (259/440))
                .clipped()
        }
        .frame(height: UIScreen.main.bounds.width * (259/440))
    }
    
    private var bannerSection1: some View {
        Image("sizeup")
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .frame(width: 420)
            .clipped()
            .padding(.horizontal, 10)
            .padding(.top, 40)
    }
    
    private var recommendedSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("(설정 닉네임)님을 위한 추천 메뉴")
                .font(.PretendardRegualar24)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(model.coffees.indices, id: \.self) { index in
                        NavigationLink(destination: CoffeeView(coffee: NaviCoffeeModel.coffees[index])) {
                            VStack {
                                Image("coffee\(index)")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(8)
                                Text(model.coffees[index])
                                    .font(.PretendardSemibold14)
                                    .foregroundColor(.black)
                                    .padding(.top, 10)
                            }
                            .frame(width: 150)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }

    
    private var bannerSection2: some View {
        VStack(spacing: 0) {
            Image("Blooming")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 451)
                .clipped()
                .padding(.top, 20)

            Image("subscribe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 200)
                .clipped()
                .padding(.top, 20)
        }
        .padding(.horizontal, 10)
    }
    
    private var whatsNewSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("What's New")
                .font(.PretendardRegualar24)
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(model.whatsnew.indices, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 8) {
                            Image("whatnew\(index)")
                                .resizable()
                                .frame(width: 242, height: 160)
                                .cornerRadius(8)

                            Text(model.whatsnew[index])
                                .font(.PretendardMedium18)

                            Text(model.whatsnew2[index])
                                .font(.PretendardMedium13)
                                .foregroundColor(.gray)
                        }
                        .frame(width: 242, alignment: .leading)
                    }
                }
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
    }

    
    private var bannerSection3: some View {
        VStack(spacing: 0) {
            Image("mugcup")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 217)
                .clipped()
                .padding(.top, 20)
            Image("onlinestore")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 272)
                .clipped()
                .padding(.top, 20)
            Image("delivery")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 217)
                .clipped()
                .padding(.top, 20)
        }
        .padding(.horizontal, 10)
    }
    
    private var dessertSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("하루가 달콤해지는 디저트")
                .font(.PretendardSemiBold24)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(model.desserts.indices, id: \.self) { index in
                        VStack {
                            Image("bread\(index)")
                                .resizable()
                                .frame(width: 130, height: 130)
                                .cornerRadius(8)
                            Text(model.desserts[index])
                                .font(.PretendardSemibold14)
                        }
                        .frame(width: 130)
                    }
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }
    
    private var bannerSection4: some View {
        VStack(spacing: 0) {
            Image("coldbrew")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 182)
                .clipped()
                .padding(.top, 20)
            Image("baristar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 360)
                .clipped()
                .padding(.top, 20)
            Image("lastBanner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 420)
                .frame(height: 182)
                .clipped()
                .padding(.top, 20)
        }
    }
}

#Preview {
    HomeView()
}

//배너 패딩 물어보기
//왓츠 뉴 물어보기
//설정 닉네임 물어보기
