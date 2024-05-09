//
//  LoginViewModel.swift
//  Honzapda
//
//  Created by YOUJIM on 5/8/24.
//

import SwiftUI


class LoginViewModel: ObservableObject {
    @Published public var id = ""
    @Published public var password = ""
    @Published public var isAutoLoginEnabled = false
}
