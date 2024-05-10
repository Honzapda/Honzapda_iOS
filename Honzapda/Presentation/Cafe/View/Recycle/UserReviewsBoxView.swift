//
//  UserReviewBox.swift
//  Honzapda
//
//  Created by 송영훈 on 4/1/24.
//

import SwiftUI

// MARK: - 유저 리뷰 박스
struct UsersReviewBoxView: View {
    // MARK: PARAMETER
    var userProfileImageURL: String?
    var userName: String?
    var reviewScore: Double?
    var reviewRecommendCount: Int?
    var userReview: String?
    var userVisitDate: String?
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray02)
                .cornerRadius(12)
            
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: "bolt")
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("맥구")
                            .font(.sCoreDream(.bold, size: 14))
                        
                        Text("별점 5점")
                            .font(.sCoreDream(.medium, size: 10))
                            .foregroundColor(.primary04)
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
                } //: 유저
                // 리뷰 내용
                Text("처음 가봤는데 사장님이 친절하시고 강아지가 귀엽고 인테리어가 예뻐요! 조용해서 친구랑 가서 이야기하기 좋습니다. 근데 가서 공부하기에는 테이블도 협소하고 분위기도 그런 분위기는 아닌 것 같아요. 담소 나누기 좋은 카페 ^_^")
                    .font(.sCoreDream(.medium, size: 11))
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("2024.02.17 방문")
                        .font(.sCoreDream(.medium, size: 10))
                        .foregroundColor(.gray07)
                    
                    Spacer()
                    
                    Text("리뷰 신고하기")
                        .font(.sCoreDream(.medium, size: 9))
                        .foregroundColor(.gray06)
                }
                //: 리뷰 내용
            } //: 유저 & 리뷰 내용
            .padding(24)
        }
    }
} //: 유저 리뷰 박스

#Preview {
    UsersReviewBoxView()
}
