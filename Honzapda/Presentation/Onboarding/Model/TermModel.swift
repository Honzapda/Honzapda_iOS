//
//  TermModel.swift
//  Honzapda
//
//  Created by 송영훈 on 5/29/24.
//

import Foundation

struct TermModel: Hashable {
    let type: String    // 약관 타입
    let title: String   // 약관 제목
    var isTermAgree: Bool   // 약관 동의
    var isTermButtonClicked: Bool   // 약관 타이틀 버튼 터치 여부
    let content: String // 약관 내용
    
}
