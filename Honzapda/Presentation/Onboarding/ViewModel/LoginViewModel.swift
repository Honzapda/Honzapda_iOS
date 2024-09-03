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
    @Published var loginData: LoginResponseModel? = nil
    
    private func updateLoginData(newData: LoginResponseModel) {
        self.loginData = newData
        print(self.loginData)
    }
    
    func apiAuthLogin(email: String, passward: String, completion: @escaping () -> Void) {
        APIManager.shared.postData(urlEndpointString: Constant.authLogin,
                                   responseDataType: CommonResponseModel<LoginResponseModel>.self,
                                   requestDataType: LoginRequestModel.self,
                                   parameter: LoginRequestModel(email: email, password: passward)) { response in
            // TODO: 여기서 메인 스레드에 영향을 미쳐서 뷰를 변경시켜야 함.
            DispatchQueue.global().async {
                if response.isSuccess {
                    self.updateLoginData(newData: response.result)
                    
                } else {
                    print("Login Failed. Code: \(response.code), Message: \(response.message)")
                }
                completion() // callback함수로 적용
            }
        }
    }
}
