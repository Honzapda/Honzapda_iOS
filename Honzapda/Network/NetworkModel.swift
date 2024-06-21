//
//  NetworkModel.swift
//  Honzapda
//
//  Created by YOUJIM on 2/28/24.
//

import Foundation

struct APIModel<T: Codable>: Codable {
    let isSuccess: Bool?
    let code: String?
    let message: String?
    let result: T?
}
