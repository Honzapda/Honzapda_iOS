//
//  HelpMessageView.swift
//  Honzapda
//
//  Created by 황주연 on 3/9/24.
//

import SwiftUI

// MARK: - 도움말 뷰
struct HelpMessageView: View {
    @Environment(\.dismiss) var dismiss
    
    var backButton: some View { // 뒤로가기 버튼
        Button {
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
            }
        }
    } //: 뒤로가기 버튼
    
    // MARK: BODY
    var body: some View {
        HStack { // 뒤로가기 버튼
            backButton.padding(EdgeInsets(top: 0,
                                          leading: 16,
                                          bottom: 5,
                                          trailing: 0)
            )
            Spacer()
        } //: 뒤로가기 버튼
        ZStack {
            Color.gray01.frame(maxHeight: .infinity)
            VStack {
                HelpMessageCardView() // 도움말 카드 뷰
                    .padding(.top, 16)
                Spacer()
            }
        }
        .frame(maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
    } //: BODY
}

// MARK: - 도움말 카드 뷰
struct HelpMessageCardView: View {
    // MARK: BODY
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading) { // 도움말 내용
                    Text("Q. 혼잡도를 어떻게 보나요?")
                        .foregroundColor(Color.primary06)
                        .font(.custom("S-CoreDream-7ExtraBold", size: 16))
                        .padding(.bottom, 10)
                    
                    Text("리뷰 창, 정보 제공 창, 그리고 홈에서 위치마커를 눌렀을 시 나오는 가게 창과 검색 기능의 일반 가게 창에서도 확인 가능합니다.")
                        .font(.custom("S-CoreDream-5Medium", size: 12))
                        .foregroundColor(Color.gray08)
                        .lineSpacing(10)
                        .lineLimit(nil)
                } //: 도움말 내용
                .padding(24)
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 1)
        }
        .padding(EdgeInsets(top: 0, 
                            leading: 16,
                            bottom: 24,
                            trailing: 16)
        )
    }
}

#Preview {
    HelpMessageView()
}

#Preview {
    HelpMessageCardView()
}
