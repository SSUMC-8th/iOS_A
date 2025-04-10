import SwiftUI
import PhotosUI

struct ReceiptTop: View {
    @ObservedObject private var viewModel: ReceiptViewModel
    init(viewModel: ReceiptViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    @State private var selectedItems: [PhotosPickerItem] = []
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            // 뒤로가기 버튼
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.PretendardMedium18)//19로 변경
                    .padding(.leading, 16)
                    .foregroundStyle(Color.black)
            }
            
            Spacer()
            
            // 중앙 제목
            Text("전자영수증")
                .font(.PretendardMedium16)
            
            Spacer()
            
            // 플러스 버튼: 이미지 추가를 위한 액션 시트 호출
            Button(action: {
                showActionSheet = true
            }){
                Image(systemName: "plus")
                    .font(.PretendardMedium18)//19
                    .padding(.trailing, 16)
                    .foregroundStyle(Color.black)
            }
        }
        .background(Color.white)
        // 액션 시트: 앨범 또는 카메라 선택 옵션 제공
        .confirmationDialog("사진을 어떻게 추가할까요?", isPresented: $showActionSheet, titleVisibility: .visible) {
            Button("앨범에서 가져오기") {
                showPhotosPicker = true
            }
            
            Button("카메라로 촬영하기") {
                showCamera = true
            }
            
            Button("취소", role: .cancel) {}
        }
        // 카메라로 촬영한 경우: CameraPicker 대신 ImagePicker를 사용합니다.
        .sheet(isPresented: $showCamera) {
            ImagePicker(sourceType: .camera) { image in
                viewModel.startOCR(with: image)
            }
        }
        // 사진 선택기: PhotosPicker를 사용하여 앨범에서 이미지를 선택
        .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItems, maxSelectionCount: 5, matching: .images)
        .onChange(of: selectedItems) { _, newItems in
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        viewModel.startOCR(with: image)
                    }
                }
            }
        }
    }
}
