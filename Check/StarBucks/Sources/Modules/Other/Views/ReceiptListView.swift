//
//  ReceiptListView.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ReceiptListView: View {
    
    // MARK: - @EnvironmentObject
    /// 의존성 주입 컨테이너
    @EnvironmentObject var container: DIContainer
    
    // MARK: - @Environment
    /// ModelContext
    @Environment(\.modelContext) private var context
    
    // MARK: - @State
    /// 뷰모델
    @State var viewModel: ReceiptListViewModel = .init()
    
    // MARK: - @Query
    /// 레시피 모델
    @Query(sort: \ReceiptModel.createdAt, order: .reverse) private var receipts: [ReceiptModel]
    
    init(container: DIContainer) {
        
    }
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 16) {
                
                navigationBar(left: {
                    container.navigationRouter.pop()
                }, right: {
                    viewModel.showDialog = true
                })
                
                receiptListInfo
                
                scrollView
                
                Spacer()
            }
            .safeAreaPadding(.horizontal, 16)
            
            
            if viewModel.showReceiptIndex != nil {
                receiptImage(close: {
                    viewModel.showReceiptIndex = nil
                })
                .ignoresSafeArea(.all)
            }
        }
        .confirmationDialog("영수증을 어떻게 추가할까요?", isPresented: $viewModel.showDialog, titleVisibility: .visible ,actions: {
            
            Button("앨범에서 가져오기", action: {
                viewModel.showImagePicker = true
            })
            Button("카메라로 촬영하기", action: {
                viewModel.showCameraPicker = true
            })
            Button("취소", role: .cancel, action: {})
            
        })
        .photosPicker(
            isPresented: $viewModel.showImagePicker,
            selection: $viewModel.photosPickerItem
        )
        .fullScreenCover(isPresented: $viewModel.showCameraPicker, content: {
            CameraPicker(onImageSelected: {
                image in
                viewModel.uiImage = image
            })
        })
        .onChange(of: viewModel.photosPickerItem) { (oldValue, newValue) in
            guard let photosPickerItem = viewModel.photosPickerItem else {
                return
            }
            Task {
                if let data = try? await photosPickerItem.loadTransferable(
                    type: Data.self
                ),
                   let image = UIImage(data: data)
                {
                    viewModel.uiImage = image
                    
                }
                
            }
        }
        .onChange(of: viewModel.receipt) { oldValue, newValue in
            guard let receipt = newValue else { return }
            context.insert(receipt)
            try? context.save()
        }
        .background(Color.white01)
        .navigationBarBackButtonHidden(true)
    }
    
    /// 네비게이션 바
    /// - Parameters:
    ///   - left: 뒤로 가기 버튼 탭
    ///   - right: + 버튼 탭
    /// - Returns: 네비게이션 바
    private func navigationBar(left: @escaping () -> Void, right: @escaping () -> Void) -> some View {
        
        HStack {
            Button(action: left, label: {
                
                Image(systemName: "chevron.backward")
                    .tint(Color.black)
            })
            
            Spacer()
            
            Text("전자영수증")
                .font(.mainTextMedium16)
                .foregroundStyle(.black)
            
            Spacer()
            
            Button(action: right, label: {
                
                Image(systemName: "plus")
                    .tint(Color.black)
                
            })
            
            
        }
        .frame(height: 70)
        .background(.white)
    }
    
    /// 영수증 리스트의 전체 정보
    private var receiptListInfo: some View {
        HStack {
            let count = receipts.count
            let sum = receipts.reduce(0) { $0 + $1.totalAmount }
            
            HStack(spacing: 4) {
                Text("총")
                    .font(.mainTextLight18)
                    .foregroundStyle(.black)
                
                Text("\(count)건")
                    .font(.mainTextSemiBold18)
                    .foregroundStyle(Color.brown01)
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                Text("사용합계")
                    .font(.mainTextLight18)
                    .foregroundStyle(.black)
                Text("\(sum)")
                    .font(.mainTextSemiBold18)
                    .foregroundStyle(Color.brown01)
            }
        }
    }
    
    /// 영수증 리스트 스크롤 뷰
    private var scrollView: some View {
        ScrollView {
            LazyVStack(spacing: 14) {
                ForEach(Array(self.receipts.enumerated()), id: \.element.id) { (
                    index,
                    receipt
                ) in
                    receiptItem(receipt)
                        .onTapGesture {
                            viewModel.showReceiptIndex = index
                        }
                }
                
            }
        }
    }
    
    /// 영수증 리스트 아이템
    /// - Parameter receipt: 영수증
    /// - Returns: 영수증 리스트 아이템
    private func receiptItem(_ receipt: ReceiptModel) -> some View {
        
        
        VStack(alignment: .leading, spacing: 9) {
            
            Text(receipt.store)
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color.black)
            
            HStack {
                
                Text(toString(from: receipt.createdAt))
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.gray03)
                
                Spacer()
                
                Icon.receipt.image
                    .resizable()
                    .frame(width: 16, height: 20)
            }
            
            Text("\(receipt.totalAmount)")
                .font(.mainTextSemiBold16)
                .foregroundStyle(Color.brown02)
            
            Divider()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.gray01)
                .padding(.top, 5)
        }
    }
    
    
    /// 레시피 리스트의 아이템
    /// - Parameter close: 영수증 닫기 버튼
    /// - Returns: 레시피 리스트의 아이템
    private func receiptImage(close: @escaping () -> Void) -> some View {
        ZStack(alignment: .topTrailing) {
            Color.black.opacity(0.8)
            
            if let data = receipts[viewModel.showReceiptIndex!].image,
               let uiImage = UIImage(data: data) {
                
                Image(uiImage: uiImage)
                    .resizable()
                    .padding(.horizontal, 60)
                    .padding(.vertical, 60)
                
                Button(action: {
                    close()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .tint(Color.gray04)
                    
                })
                .padding(.horizontal, 78)
                .padding(.vertical, 78)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    /// Date를 String으로 변환
    /// - Parameter date: 영수증 촬영 날짜
    /// - Returns: 문자열
    private func toString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter.string(from: date)
    }

}

    

#Preview {
    let container = DIContainer()
    ReceiptListView(container: container)
        .environmentObject(container)
}
