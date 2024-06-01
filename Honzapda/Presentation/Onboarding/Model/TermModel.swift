//
//  TermModel.swift
//  Honzapda
//
//  Created by 송영훈 on 5/29/24.
//

import Foundation

struct TermModel: Hashable {
    let type: String
    let title: String
    var isTermAgree: Bool
    let content: String
}
