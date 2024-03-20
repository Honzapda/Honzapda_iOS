//
//  AppleLoginButtonView.swift
//  Honzapda
//
//  Created by YOUJIM on 3/6/24.
//

import AuthenticationServices
import SwiftUI

struct AppleLoginButtonView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

#Preview {
    AppleLoginButtonView()
}
