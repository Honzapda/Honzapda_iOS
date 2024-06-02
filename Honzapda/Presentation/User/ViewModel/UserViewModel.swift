//
//  UserViewModel.swift
//  Honzapda
//
//  Created by 황주연 on 3/14/24.
//

import SwiftUI

class UserViewModel: ObservableObject {
    // MARK: Properties

    // TODO: 프로필 사진 서버에서 불러오는 api 구현
    @Published public var profileImage: UIImage? = UIImage(named: "image_my_profile_none") // 프로필 이미지
    
    @Published public var showActionSheet: Bool = false // 카메라, 앨범 선택 actionsheet
    @Published public var showImagePicker: Bool = false // ImagePicker
    @Published public var showCamera: Bool = false // true : 카메라 실행 / false : 앨범 실행
    
    @Published public var isToggle: Bool = true // UserMainView 푸시알림설정 토글
    
    @Published public var isCafeTasteUpdate: Bool = false // 카페 취향 ToastMessage
    @Published public var isLogoutUpdate: Bool = false // 로그아웃 ToastMessage
    @Published public var isProfileUpdate: Bool = false // 프로필 사진 ToastMessage
    @Published public var isErrorUpdate: Bool = false // Error ToastMessage
    
    @Published public var sortColumn: String = "" // MyCafeView 선택된 정렬 조건
    @Published public var openNow: Bool = true // MyCafeListCardView 가게 영업 유무
}
