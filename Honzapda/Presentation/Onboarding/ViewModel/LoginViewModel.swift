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
    @Published var isLogined: Bool = false
    
    @Published var loginData: LoginResponseResult? = nil
    
    private func updateLoginData(newData: LoginResponseResult) {
        self.loginData = newData
        print(self.loginData)
    }
    
    func API_IdPwLogin(email: String, passward: String, completion: @escaping () -> Void) {
        APIManager.shared.postData(urlEndpointString: Constant.authLogin,
                                   responseDataType: CommonResponseModel<LoginResponseResult>.self,
                                   requestDataType: LoginRequestModel.self,
                                   parameter: LoginRequestModel(email: email, password: passward)) { response in
            //TODO: 여기서 메인 스레드에 영향을 미쳐서 뷰를 변경시켜야 함.
            DispatchQueue.main.async {
                if response.isSuccess {
//                    print("Login Success!")
//                    print("Response Code: \(response.code)")
//                    print("Message: \(response.message)")
//                    print("User ID: \(response.result.id)")
//                    print("User Name: \(response.result.name)")
//                    print("Profile Image URL: \(response.result.profileImage)")
//                    print("User Email: \(response.result.email)")
//                    print("Sign Up Type: \(response.result.signUpType)")
                    self.updateLoginData(newData: response.result)
                    
                } else {
                    print("Login Failed. Code: \(response.code), Message: \(response.message)")
                }
                completion() // callback함수로 적용
            }
        }
    }
}

