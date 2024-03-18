//
//  UserViewModel.swift
//  Honzapda
//
//  Created by 황주연 on 3/14/24.
//

import SwiftUI

class UserViewModel: ObservableObject {
    // MARK: Properties
    @Published public var isToggle: Bool = true // UserMainView 푸시알림설정 토글
    
    @Published public var isCafeTasteUpdate: Bool = true // 카페 취향 ToastMessage
    @Published public var isLogoutUpdate: Bool = true // 로그아웃 ToastMessage
    @Published public var isProfileUpdate: Bool = true // 프로필 사진 ToastMessage
    
    @Published public var sortColumn: String = "" // MyCafeView 선택된 정렬 조건
    @Published public var openNow: Bool = true // MyCafeListCardView 가게 영업 유무
}
