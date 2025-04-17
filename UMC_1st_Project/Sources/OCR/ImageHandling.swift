//
//  ImageHandling.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/8/25.
//

import Foundation
import SwiftUI

protocol ImageHandling: AnyObject {
    func addImage(_ images: UIImage) // 이미지 추가
    func removeImage(at index: Int) // 이미지 삭제
    func getImages() -> [UIImage] // 추가된 이미지 가져오기
    
    var isImagePickerPresented: Bool { get set } // 앨범
    var isCameraPresented: Bool { get set } //카메라
    var isDialogPresented: Bool { get set }
    var images: [UIImage] { get set } // 이미지 저장하는 변수
    var recognizedText: String { get set }
}
