import SwiftUI
import PhotosUI
import UIKit

struct ReceiptView: View {
    @Environment(\.dismiss) var dismiss
    @State var showingSheet = false
    @StateObject var viewModel = ReceiptsViewModel()
    
    @State private var selectedReceipt: ReceiptsModel? = nil
    
    @State private var showImagePicker = false
    @State private var imagePickerSource: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage? = nil //실제로 가져온 이미지
    
    var body: some View {
        VStack(spacing: 0) {
            ReceiptHeader
                .frame(maxWidth: 413)
                .padding(.horizontal, 13)
                .padding(.vertical, 22)

            ZStack {
                Color.white01
                
                List {
                    ReceiptTotal
                        .listRowBackground(Color.clear)
                    
                    ReceiptCard()
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .onAppear { //미리보기용
                    if viewModel.receipts.isEmpty {
                        viewModel.startOCR(.first)
                        viewModel.startOCR(.second)
                    }
                }
                .fullScreenCover(item: $selectedReceipt) { receipt in
                    ShowReceiptView(receipt: receipt, isPresented: $selectedReceipt)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: imagePickerSource) { image in
                self.selectedImage = image
                viewModel.startOCR(image) // 가져온 이미지로 OCR 실행하기
            }
        }
    }
    
    private var ReceiptHeader: some View {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "lessthan")
                    .foregroundColor(Color.black)
            })
            
            Spacer()
            
            Text("전자영수증")
                .font(.mainTextMedium16)
            
            Spacer()
            
            Button(action: {
                self.showingSheet = true
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(Color.black)
            })
            .actionSheet(isPresented: $showingSheet) {
                ActionSheet(
                    title: Text("영수증을 어떻게 추가할까요?"),
                        buttons: [
                            .default(Text("앨범에서 가져오기")) {
                                imagePickerSource = .photoLibrary
                                showImagePicker = true
                            },
                            .default(Text("카메라로 촬영하기")) {
                                imagePickerSource = .camera
                                showImagePicker = true
                            },
                            .cancel(Text("취소"))
                        ]
                )
            }
        }
    }
    
    private var ReceiptTotal: some View {
        VStack {
            HStack {
                HStack(spacing: 0) {
                    Text("총 ")
                        .font(.mainTextRegular18)
                    Text("\(viewModel.receipts.count)건")
                        .font(.mainTextRegular18)
                        .foregroundStyle(Color.brown01)
                }
                Spacer()
                HStack(spacing: 0) {
                    Text("사용합계 ")
                        .font(.mainTextRegular18)
                    Text("\(viewModel.receipts.reduce(0) { $0 + $1.totalAmount })원")
                        .font(.mainTextRegular18)
                        .foregroundStyle(Color.brown01)
                }
            }
            .frame(maxWidth: 402, maxHeight: 21)
            
        }
        .padding(.horizontal, 19)
        .padding(.top, 14)
        .padding(.bottom, 24)
    }
    
    private func ReceiptCard() -> some View {
        ForEach(viewModel.receipts, id: \.id) { receipt in
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 9) {
                        Text(receipt.store)
                            .font(.mainTextSemiBold18)
                        Text(receipt.purchasedAt)
                            .font(.mainTextMedium16)
                            .foregroundStyle(Color.gray03)
                        Text("\(receipt.totalAmount)원")
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(Color.brown02)
                    }
                    Spacer()
                    
                    Button(action: {
                        selectedReceipt = receipt
                    }, label: {
                        Image("dollar")
                    })
                }
                Spacer().frame(height: 14)
                Divider()
            }
            .frame(maxWidth: 402, maxHeight: 93)
            .padding(.horizontal, 19)
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button(role: .destructive) {
                    if let index = viewModel.receipts.firstIndex(where: { $0.id == receipt.id }) {
                        viewModel.receipts.remove(at: index)
                    }
                } label: {
                    Label("삭제", systemImage: "trash")
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.onImagePicked(uiImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType
    var onImagePicked: (UIImage) -> Void
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

#Preview {
    ReceiptView()
}
