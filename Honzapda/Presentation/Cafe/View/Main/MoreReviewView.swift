//
//  MoreReview.swift
//  Honzapda
//
//  Created by 송영훈 on 4/1/24.
//

import SwiftUI

// MARK: - MAIN VIEW
struct MoreReviewView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                PhotoCollectView()
                DividerBoxView()
                ReviewView()
            }
        }
        .toolbar {
            Button {
                print("Heart button")
            } label: {
                Image("Cafe/icon_my_heart_none")
            }
        }
    }
    // TODO: Navibar right button
} //: MAIN VIEW

// MARK: - 사진 모아보기
struct PhotoCollectView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("사진 모아보기")
                  .font(Font.custom("S-Core Dream", size: 18))
                  .foregroundColor(.gray09)
                
                Spacer()
                
                NavigationLink("모든 사진 보기", destination: Text("모든 사진 보기"))
                    .font(Font.custom("S-Core Dream", size: 11))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.primary05)
            }
            .padding(EdgeInsets(top: 32, leading: 24, bottom: 0, trailing: 24))
            
            // TODO: 캐러셀 뷰 만들기 for 사진
        }
    }
}

// MAKR: - 리뷰
struct ReviewView: View {
    // MARK: PARAMETER
    var reviewCount: Int = 3
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 16) {
            HStack { // 리뷰 헤더
                Spacer()
                    .frame(width: 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Text("리뷰 ")
                            .font(Font.custom("S-Core Dream", size: 18))
                            .foregroundColor(.gray09)
                        + Text("\(reviewCount)")
                            .font(Font.custom("S-Core Dream", size: 18))
                            .foregroundColor(.primary05)
                        + Text("개")
                            .font(Font.custom("S-Core Dream", size: 18))
                            .foregroundColor(.gray09)
                    }
                    Text("유저들이 제공한 리뷰를 살펴보세요.\n유저들이 선택한 정보 순으로 제공해드릴게요 :)")
                        .font(Font.custom("S-Core Dream", size: 11))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray06)
                    
                    Spacer().frame(height: 0)
                }
                
                Spacer()
                
                NavigationLink("리뷰 더 보기", destination: MoreReviewView())
                .font(Font.custom("S-Core Dream", size: 11))
                .foregroundColor(.primary05)
            } //: 리뷰 헤더
            ForEach(0..<reviewCount) { reviewerName in  // TODO: 리뷰어 이름 리스트 받아서 뿌리기
                UsersReviewBoxView()
            }
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    }
} //: 리뷰

#Preview {
    MoreReviewView()
}
