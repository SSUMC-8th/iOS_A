import SwiftUI

struct OtherView: View {
    // 닉네임 불러오기용 ViewModel
    @State private var signupViewModel = SignupViewModel()
    // 버튼 액션 처리용 ViewModel
    @State private var otherViewModel = OtherViewModel()

    var body: some View {
        // 닉네임이 없으면 "(작성한 닉네임)"으로 대체
        let nickname = signupViewModel.savedNickname.isEmpty
            ? "(작성한 닉네임)"
            : signupViewModel.savedNickname

        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // 상단 닉네임 문구
                Text("\(nickname)님 환영합니다!")
                    .font(.title3)
                    .fontWeight(.semibold)

                // 아래 여백 16
                Spacer().frame(height: 16)

                // 가로로 3개 버튼 (각각 102x108)
                HStack(spacing: 16) {
                    // 1) 별 히스토리
                    Button(action: {
                        // 액션 처리
                    }) {
                        VStack(spacing: 8) {
                            Image("star")  // 원하는 에셋 이름으로 교체
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text("별 히스토리")
                                .font(.PretendardMedium16)
                                .accentColor(Color.black)
                        }
                        .frame(width: 102, height: 108)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
                    }

                    // 2) 전자영수증
                    Button(action: {
                        // 액션 처리
                    }) {
                        VStack(spacing: 8) {
                            Image("receipt")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text("전자영수증")
                                .font(.PretendardMedium16)
                                .accentColor(Color.black)                        }
                        .frame(width: 102, height: 108)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
                    }

                    // 3) 나만의 메뉴
                    Button(action: {
                    }) {
                        VStack(spacing: 8) {
                            Image("mymenu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text("나만의 메뉴")
                                .font(.PretendardMedium16)
                                .accentColor(Color.black)
                        }
                        .frame(width: 102, height: 108)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
                    }
                }

                // Pay 섹션
                Spacer().frame(height: 24)
                Text("Pay")
                    .font(.headline)

                // Pay 첫 줄 (24pt 아래)
                Spacer().frame(height: 24)
                HStack(spacing: 16) {
                    Button("스타벅스 카드 등록") {
                        // 액션
                    }
                    Button("카드 교환권 등록") {
                        // 액션
                    }
                }
                .font(.subheadline)

                // Pay 두 번째 줄 (32pt 아래)
                Spacer().frame(height: 32)
                HStack(spacing: 16) {
                    Button("쿠폰 등록") {
                        otherViewModel.printCouponRegister()
                    }
                    Button("쿠폰 히스토리") {
                        // 액션
                    }
                }
                .font(.subheadline)

                // 고객지원 섹션
                Spacer().frame(height: 24)
                Text("고객지원")
                    .font(.headline)

                // 고객지원 첫 줄 (24pt 아래)
                Spacer().frame(height: 24)
                HStack(spacing: 16) {
                    Button("스토어 케어") {
                        // 액션
                    }
                    Button("고객의 소리") {
                        // 액션
                    }
                }
                .font(.subheadline)

                // 고객지원 두 번째 줄 (32pt 아래)
                Spacer().frame(height: 32)
                HStack(spacing: 16) {
                    Button("매장 정보") {
                        // 액션
                    }
                    Button("반납기 정보") {
                        // 액션
                    }
                }
                .font(.subheadline)

                // 고객지원 세 번째 줄 (32pt 아래)
                Spacer().frame(height: 32)
                HStack(spacing: 16) {
                    Button("마이 스타벅스 리뷰") {
                        // 액션
                    }
                }
                .font(.subheadline)

                Spacer().frame(height: 24)
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
        }
    }
}

#Preview {
    OtherView()
}
