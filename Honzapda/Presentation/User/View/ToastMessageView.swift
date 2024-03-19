//
//  ToastMessageView.swift
//  Honzapda
//
//  Created by 황주연 on 3/3/24.
//

import SwiftUI
// TODO: toastmessage 연결

// MARK: - ToastMessage 에러 뷰
struct ErrorToastMessageView: View {
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("image_my_toastmessage_error")
                    .frame(width: 361, height: 50)
            }
            .padding()
        }
        .shadow(color: Color.black.opacity(0.25),
                radius: 4, x: 0, y: 1)
    }
}

// MARK: - ToastMessage 카페취향 업데이트 뷰
struct CafeTasteToastMessageView: View {
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("image_cafetaste_toastmessage")
                    .frame(width: 361, height: 50)
            }
            .padding()
        }
        .shadow(color: Color.black.opacity(0.25),
                radius: 4, x: 0, y: 1)
    }
}

// MARK: - ToastMessage 로그아웃 업데이트 뷰
struct LogoutToastMessageView: View {
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("image_my_logout_toastmessage")
                    .frame(width: 361, height: 50)
            }
            .padding()
        }
        .shadow(color: Color.black.opacity(0.25),
                radius: 4, x: 0, y: 1)
    }
}

// MARK: - ToastMessage 프로필 사진 업데이트 뷰
struct ProfileToastMessageView: View {
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("image_my_profile_toastmessage")
                    .frame(width: 361, height: 50)
            }
            .padding()
        }
        .shadow(color: Color.black.opacity(0.25),
                radius: 4, x: 0, y: 1)
    }
}

#Preview {
    CafeTasteToastMessageView()
}

#Preview {
    ErrorToastMessageView()
}

#Preview {
    LogoutToastMessageView()
}

#Preview {
    ProfileToastMessageView()
}
