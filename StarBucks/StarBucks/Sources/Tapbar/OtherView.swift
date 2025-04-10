import SwiftUI

extension Color {
    static let starBucksGray = Color("StarBucksGray")
}

struct OtherView: View {
    @State private var signupViewModel = SignupViewModel()
    @State private var otherViewModel = OtherViewModel()

    var body: some View {
        let nickname = signupViewModel.savedNickname.isEmpty ? "(작성한 닉네임)" : signupViewModel.savedNickname

        ZStack {
            Color(red: 248/255, green: 248/255, blue: 248/255)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(nickname)님\n환영합니다!")
                        .font(.PretendardBold24)
                        .padding(.horizontal, 135)

                    Spacer().frame(height: 16)

                    HStack(spacing: 10) {
                        Button(action: {}) {
                            VStack(spacing: 8) {
                                Image("star")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 40)
                                Text("별 히스토리")
                                    .font(.PretendardMedium16)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 102, height: 108)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
                        }

                        NavigationLink {
                            ReceiptView()}
                            label: {
                            VStack(spacing: 8) {
                                Image("receipt")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                Text("전자영수증")
                                    .font(.PretendardMedium16)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 102, height: 108)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
                        }

                        Button(action: {}) {
                            VStack(spacing: 8) {
                                Image("mymenu")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                Text("나만의 메뉴")
                                    .font(.PretendardMedium16)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 102, height: 108)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
                        }
                    }
                    .padding(.horizontal, 40)

                    Spacer().frame(height: 41)

                    Text("Pay")
                        .font(.PretendardBold24)
                        .foregroundColor(.black)
                        .padding(.leading, 10)

                    Spacer().frame(height: 24)

                    HStack(spacing: 0) {
                        Button(action: { print(" pay 1 클릭") }) {
                            Image("starbuckscard")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("스타벅스 카드 등록")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)

                        Spacer(minLength: 16)

                        Button(action: { print(" pay 2 클릭") }) {
                            Image("changecard")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("카드 교환권 등록")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 10)
                    }
                    .font(.subheadline)

                    Spacer().frame(height: 32)

                    HStack(spacing: 0) {
                        Button(action: { print(" pay 3 클릭") }) {
                            Image("coupon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("쿠폰 등록")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)

                        Spacer(minLength: 16)

                        Button(action: { print(" pay 4 클릭") }) {
                            Image("couponhistory")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("쿠폰 히스토리")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 10)
                    }
                    .font(.subheadline)

                    Spacer().frame(height: 40)

                    Text("고객지원")
                        .font(.PretendardBold24)
                        .foregroundColor(.black)
                        .padding(.leading, 10)

                    Spacer().frame(height: 24)

                    HStack(spacing: 0) {
                        Button(action: { print(" 고객 1 클릭") }) {
                            Image("store")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("스토어 케어")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)

                        Spacer(minLength: 16)

                        Button(action: { print(" 고객 2 클릭") }) {
                            Image("sound")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("고객의 소리")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 10)
                    }
                    .font(.subheadline)

                    Spacer().frame(height: 32)

                    HStack(spacing: 0) {
                        Button(action: { print(" 고객 3 클릭") }) {
                            Image("locate")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("매장 정보")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)

                        Spacer(minLength: 16)

                        Button(action: { print(" 고객 4 클릭") }) {
                            Image("return")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("반납기 정보")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 10)
                    }
                    .font(.subheadline)

                    Spacer().frame(height: 32)

                    HStack(spacing: 0) {
                        Button(action: { print(" 고객 5 클릭") }) {
                            Image("review")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            Text("마이 스타벅스 리뷰")
                                .font(.PretendardMedium16)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)

                        Spacer()
                    }
                    .font(.subheadline)

                    Spacer().frame(height: 24)
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    OtherView()
}
