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
    @Published public var isErrorViewAppeared = false
    @Published public var isSignUpButtonTapped = false
    
    private var LoginData: LoginResponseResult? = nil
    
    private func UpdateLoginData(newData: LoginResponseResult) {
        
    }
    
    func API_IdPwLogin(email: String, passward: String) {
        APIManager.shared.postData(urlEndpointString: Constant.authLogin,
                                   responseDataType: CommonResponseModel<LoginResponseResult>.self,
                                   requestDataType: LoginRequestModel.self,
                                   parameter: LoginRequestModel(email: email, password: passward)) { response in
            if response.isSuccess {
                print("Login Success!")
                print("Response Code: \(response.code)")
                print("Message: \(response.message)")
                print("User ID: \(response.result.id)")
                print("User Name: \(response.result.name)")
                print("Profile Image URL: \(response.result.profileImage)")
                print("User Email: \(response.result.email)")
                print("Sign Up Type: \(response.result.signUpType)")
            } else {
                print("Login Failed. Code: \(response.code), Message: \(response.message)")
            }
        }
    }
}

//struct LoginRequestModel: Codable {
//    let email: String
//    let password: String
//}
//
//struct LoginResponseResult: Decodable {
//    let id: Int
//    let name: String
//    let profileImage: String
//    let email: String
//    let signUpType: String
//}
//
