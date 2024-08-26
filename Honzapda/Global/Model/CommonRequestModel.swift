//
//  CommonRequestModel.swift
//  Honzapda
//
//  Created by 이재용 on 8/26/24.
//

import Foundation

struct CommonResponseModel<ResultType: Decodable>: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: ResultType
}

