//
//  UsersHelpfulInformationBox.swift
//  Honzapda
//
//  Created by 송영훈 on 4/1/24.
//

import SwiftUI

// MARK: - 유저 도움 정보 박스
struct UsersHelpfulInformationBoxView: View {
    // MARK: PARAMETER
    var userProfileImageURL: String?
    var userName: String?
    var userVisitDay: String?   // 유저 방문 날짜
    var userVisitTime: Int?
    var recommendCount: Int?    // 추천 수
    var congestion: String?
    var deskSize: String?
    var outletCount: String?
    var light: String?
    var outletLocation: String?
    var restroomLocation: String?
    var musicGenre: String?
    var atmosphere: String?
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray02)
                .cornerRadius(12)
            
            VStack(spacing: 20) {
                HStack(spacing: 12) { // 유저 정보
                    Image(systemName: "bolt")
                    
                    VStack(alignment: .leading) {
                        Text("체리")
                            .font(.sCoreDream(.bold, size: 14))
                            .foregroundColor(.gray09)
                        
                        Text("이 카페를 ")
                            .font(.sCoreDream(.medium, size: 10))
                            .foregroundColor(.gray07)
                        + Text("목요일 17시")
                            .font(.sCoreDream(.bold, size: 10))
                            .foregroundColor(.primary05)
                        + Text("에 방문했어요")
                            .font(.sCoreDream(.medium, size: 10))
                            .foregroundColor(.gray07)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 6) {
                        Image("Cafe/icon_my_heart_none")
                            .renderingMode(.template)
                            .foregroundColor(.primary05)
                        
                        Text("추천 ")
                            .font(.sCoreDream(.medium, size: 9))
                        + Text("123")
                            .font(.sCoreDream(.bold, size: 9))
                            .foregroundColor(.primary05)
                        + Text("개")
                            .font(.sCoreDream(.medium, size: 9))
                    }
                } //: 유저 정보
                
                VStack(alignment: .leading, spacing: 12) { // 유저 제공 카페 정보
                    HStack(spacing: 4) {
                        Text("혼잡도는")
                            .font(.sCoreDream(.medium, size: 12))
                        
                        UsersHelpfulInformationUnderbarView(info: "90%")
                        
                        Text("정도인 것 같아요")
                            .font(.sCoreDream(.medium, size: 12))
                    }
                    
                    HStack(spacing: 4) {
                        UsersHelpfulInformationUnderbarView(info: "넓은")
                        
                        Text("책상을 보유하고 있어요")
                            .font(.sCoreDream(.medium, size: 12))
                    }
                    
                    HStack(spacing: 4) {
                        UsersHelpfulInformationUnderbarView(info: "넉넉한")
                        Text("콘센트를 보유하고 있고 주로")
                            .font(.sCoreDream(.medium, size: 12))
                        UsersHelpfulInformationUnderbarView(info: "책상 밑")
                        Text("에 있어요")
                            .font(.sCoreDream(.medium, size: 12))
                    }
                    
                    HStack(spacing: 4) {
                        Text("화장실은")
                            .font(.sCoreDream(.medium, size: 12))
                        UsersHelpfulInformationUnderbarView(info: "1층 계단 옆")
                        Text("에 있어요")
                            .font(.sCoreDream(.medium, size: 12))
                    }
                    
                    HStack(spacing: 4) {
                        Text("노래는")
                            .font(.sCoreDream(.medium, size: 12))
                        UsersHelpfulInformationUnderbarView(info: "잔잔한")
                        Text("음악이 많이 나와요")
                            .font(.sCoreDream(.medium, size: 12))
                    }
                    
                    HStack(spacing: 4) {
                        Text("조명은")
                            .font(.sCoreDream(.medium, size: 12))
                        UsersHelpfulInformationUnderbarView(info: "밝은")
                        Text("편이예요")
                            .font(.sCoreDream(.medium, size: 12))
                    }
                    
                    HStack(spacing: 4) {
                        Text("전체적인 분위기는")
                            .font(.sCoreDream(.medium, size: 12))
                        UsersHelpfulInformationUnderbarView(info: "아늑한")
                        Text("것 같아요")
                            .font(.sCoreDream(.medium, size: 12))
                    }
                } //: 유저 제공 카페 정보
            }
            .padding(24)
        }
        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
} //: 유저 도움 정보 박스
#Preview {
    UsersHelpfulInformationBoxView()
}
