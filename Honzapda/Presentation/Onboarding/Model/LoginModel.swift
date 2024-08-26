//
//  LoginModel.swift
//  Honzapda
//
//  Created by 이재용 on 8/26/24.
//

import Foundation

struct LoginRequestModel: Codable {
    let email: String
    let password: String
}

struct LoginResponseResult: Codable {
    let id: Int
    let name: String
    let profileImage: String
    let email: String
    let signUpType: String
}
