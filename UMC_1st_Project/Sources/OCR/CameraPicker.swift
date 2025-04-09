//
//  CameraPicker.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 4/9/25.
//

import Foundation
import SwiftUI

struct CameraPicker: UIViewControllerRepresentable {
    var imageHandler: ImageHandling
    @Environment(\.dismiss) var dismiss

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, imageHandler: imageHandler)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraPicker
        var imageHandler: ImageHandling

        init(parent: CameraPicker, imageHandler: ImageHandling) {
            self.parent = parent
            self.imageHandler = imageHandler
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.dismiss()
            if let image = info[.originalImage] as? UIImage {
                DispatchQueue.main.async {
                    self.imageHandler.addImage(image)
                }
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}

