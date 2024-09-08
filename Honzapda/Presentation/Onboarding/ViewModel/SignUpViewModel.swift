//
//  SignUpViewModel.swift
//  Honzapda
//
//  Created by 송영훈 on 6/3/24.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var signUpModel = SignUpModel()
    
    // MARK: - FUNCTION
    // 이메일 형식 체크
    func EmailValidation(email: String) -> Bool {
        if email.isEmpty {
            return false
        } else {
            /// 나중에 최소지원 16으로 올리면 /정규표현식/ 방식으로 변경
            let emailRegEx = "[A-Z0-9a-z._%+_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx) // 정규식 전환
            let isValidEmailForm = emailPredicate.evaluate(with: email) // 이메일 형식 체크
            
            if isValidEmailForm {
                //return "사용 가능한 이메일이예요! :)"
                return true
            } else {
                //return "이메일 형식이 올바르지 않아요 :("
                return false
            }
        }
    } //: 이메일 형식 체크
}
