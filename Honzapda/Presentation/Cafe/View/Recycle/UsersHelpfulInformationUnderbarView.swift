//
//  UsersHelpfulInformationUnderbar.swift
//  Honzapda
//
//  Created by 송영훈 on 4/1/24.
//

import SwiftUI

// MARK: - 유저 도움 정보 빈칸 언더바
struct UsersHelpfulInformationUnderbarView: View {
    // MARK: PARAMETER
    var info: String!
    var width: Int?
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 0) {
            Text(info)
                .foregroundColor(.primary05)
                .font(.sCoreDream(.bold, size: 14))
            
            Rectangle()
                .foregroundColor(.gray03)
                .frame(width: 38, height: 1)    // TODO: Text의 내용에 맞게 길이 조절 필요
        }
    }
} //: 유저 도움 정보 빈칸 언더바

#Preview {
    UsersHelpfulInformationUnderbarView()
}
