//
//  ReceiptView.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/8/25.
//


import SwiftUI
import SwiftData


struct ReceiptView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.modelContext) private var context
    
    @StateObject var viewModel: ReceiptViewModel
    
    @State private var isShowingActionSheet = false
    @State private var showImageViewer: Bool = false
    @State private var selectedImage: UIImage? = nil
    
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBarView(viewModel: viewModel)
            
            // 총 건수 및 합계
            HStack{
                HStack{
                    Text("총")
                        .font(.mainTextRegular18)
                    //.padding(.horizontal)
                    Text("\(viewModel.receipts.count)건")
                        .font(.mainTextRegular18)
                        .foregroundStyle(Color("brown01"))
                }
                
                Spacer()
                
                HStack{
                    Text("사용합계")
                        .font(.mainTextRegular18)
                    //.padding(.horizontal)
                    Text("\(viewModel.receipts.map { $0.totalAmount }.reduce(0, +))원")
                        .font(.mainTextRegular18)
                        .foregroundStyle(Color("brown01"))
                }
            }
            .padding(15)
            
            
            
            // 등록된 영수증 리스트
            List {
                ForEach(viewModel.receipts, id: \.id) { receipt in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(receipt.storeName)
                                .font(.mainTextSemiBold18)
                            Text(receipt.date.formatted(date: .abbreviated, time: .omitted))
                                .font(.mainTextMedium16)
                                .foregroundStyle(Color("gray03"))
                            Text("\(receipt.totalAmount)원")
                                .font(.mainTextSemiBold18)
                                .foregroundStyle(Color("brown02"))
                        }
                        Spacer()
                       
                        Button(action: {
                            if let data = receipt.imageData, let image = UIImage(data: data) {
                                selectedImage = image
                                showImageViewer = true
                            }
                        }) {
                            Image("receiptbutton")
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        
        .confirmationDialog("영수증 등록 방식 선택", isPresented: $viewModel.isDialogPresented) {
            Button("앨범에서 가져오기") {
                viewModel.isImagePickerPresented = true
            }
            Button("카메라로 촬영하기") {
                viewModel.isCameraPresented = true
            }
            Button("취소", role: .cancel) {}
        }
        .fullScreenCover(isPresented: $viewModel.isImagePickerPresented) {
            ImagePicker(imageHandler: viewModel, selectedLimit: 1)
        }
        .fullScreenCover(isPresented: $viewModel.isCameraPresented) {
            CameraPicker(imageHandler: viewModel)
        }
        .fullScreenCover(isPresented: $showImageViewer) {
            if let selectedImage = selectedImage {
                ZStack(alignment: .topTrailing) {
                    Color.black.ignoresSafeArea()
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Button(action: {
                        showImageViewer = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
        }
        .onAppear {
            viewModel.setContext(context)
        }
    }
}

struct NavigationBarView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: ReceiptViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
            Spacer()
            Text("전자영수증")
                .font(.headline)
            Spacer()
            Button(action: {
                viewModel.isDialogPresented = true
            }) {
                Image(systemName: "plus")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}



 
 
struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView(viewModel: ReceiptViewModel.preview())
            .environmentObject(NavigationRouter())
    }
}
