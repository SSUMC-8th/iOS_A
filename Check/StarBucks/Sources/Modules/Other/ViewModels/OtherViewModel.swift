//
//  OtherViewModel.swift
//  StarBucks
//
//  Created by LEE on 3/24/25.
//

import Foundation
import SwiftUI

@Observable
class OtherViewModel {
    
    // MARK: = Properties
    /// 모델
    var otherModel: OtherModel = .init()
    
    /// 닉네임
    var userNickname: String {
        return otherModel.userNickname
    }
}
