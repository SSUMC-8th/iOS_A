//
//  View.swift
//  StarBucks
//
//  Created by LEE on 4/9/25.
//

import Foundation
import SwiftUI

extension View {
    
    static var screenSize: CGRect {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return windowScene.screen.bounds
    }
}
