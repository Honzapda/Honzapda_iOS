//
//  MoreHelpfulReviewView.swift
//  Honzapda
//
//  Created by 송영훈 on 4/5/24.
//

import SwiftUI

struct MoreHelpfulInformationView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HelpfulInformationView()
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
}

// MARK: - 유저 도움 정보
struct HelpfulInformationView: View {
    // MARK: PARAMETER
    var helpfulInformationCount: Int = 3
    // MARK: BODY
    var body: some View {
        VStack(spacing: 8) {
            HStack { // 유저의 도움 정보 헤더
                Spacer()
                    .frame(width: 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("유저의 도움 정보 ")
                        .font(Font.custom("S-Core Dream", size: 18))
                        .foregroundColor(.gray09)
                    + Text("\(helpfulInformationCount)")
                        .font(Font.custom("S-Core Dream", size: 18))
                        .foregroundColor(.primary05)
                    + Text("개")
                        .font(Font.custom("S-Core Dream", size: 18))
                        .foregroundColor(.gray09)
                    
                    
                    Text("유저들이 도와 제공한 카페 정보를 살펴보세요.\n유저들이 선택한 정보 순으로 제공해드릴게요 :)")
                        .font(Font.custom("S-Core Dream", size: 11))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray06)
                }
                
                Spacer()
                
                Button("정보 제공하기") {
                    print("DUBUG: 정보 더 보기")
                }
                .font(Font.custom("S-Core Dream", size: 11))
                .foregroundColor(.primary05)
            } //: 유저의 도움 정보 헤더
            
            Spacer().frame(height: 0)
            
            ForEach(0..<helpfulInformationCount) { userName in
                UsersHelpfulInformationBoxView()
            }
            
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    }
}

#Preview {
    MoreHelpfulInformationView()
}
