//
//  SignUpCurationView.swift
//  Honzapda
//
//  Created by 송영훈 on 6/4/24.
//

import SwiftUI
import WrappingHStack

// MARK: - 회원가입 큐레이션 View
struct SignUpCurationView: View {
    // MARK: PARAMS
    @StateObject var signUpCurationViewModel = SignUpCurationViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        Group {
                            Text("나만의")
                                .font(.sCoreDream(.medium, size: 22))
                            + Text("카페 취향")
                                .font(.sCoreDream(.bold, size: 22))
                                .foregroundColor(.primary05)
                            + Text("을\n생성해볼까요?")
                                .font(.sCoreDream(.medium, size: 22))
                            
                            
                            Text("좋아하는 카페 키워드를 3개 이상 골라주세요.\n선택하신 키워드를 기반으로 큐레이션한 결과를 제공해요!")
                                .font(.sCoreDream(.medium, size: 14))
                                .foregroundStyle(.gray06)
                                .padding(.bottom, 16)
                        }
                        .padding(.top, 8)
                    }
                    .multilineTextAlignment(.center)
                    .lineSpacing(6)
                    
                    WrappingHStack(signUpCurationViewModel.signUpCurationModel,
                                   id: \.self, alignment: .center) { model in
                        GrayOutlineButton(title: model.title, isSelected: model.isSelected)
                            .padding(.bottom, 6)
                    }
                }
                
                Primary05Button(text: "취향 생성 완료하기") {
                    print("DEBUG: 취향 생성 완료하기")
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationLink(destination: Text("Home View"), label: {
            Text("건너뛰기")
                .font(.sCoreDream(.medium, size: 12))
                .foregroundColor(.gray06)
        }))
    } //: BODY
} //: 회원가입 큐레이션 View

#Preview {
    SignUpCurationView()
}
