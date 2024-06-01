//
//  AppleLoginButtonView.swift
//  Honzapda
//
//  Created by YOUJIM on 3/6/24.
//

import AuthenticationServices
import SwiftUI

struct AppleLoginButtonView: View {
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                print("Authorisation successful")
            case .failure(let error):
                print("Authorisation failed: \(error.localizedDescription)")
            }
        }
        .signInWithAppleButtonStyle(.black)
        .frame(height: 45)
    }
}

#Preview {
    AppleLoginButtonView()
}
