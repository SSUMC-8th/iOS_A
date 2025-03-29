//
//  OtherViewModel.swift
//  UMC_1st_Project
//
//  Created by 이민서 on 3/24/25.
//

import Foundation
import SwiftUI

class OtherViewModel : ObservableObject {
    
    @AppStorage("nickName") var nickName: String = ""
    
}
