//
//  TermView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/29/24.
//

import SwiftUI
import PopupView

struct TermView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var termViewModel = TermViewModel()
    @State var isTermButtonClicked = false
    
    var body: some View {
        NavigationView {
            VStack {
                // 타이틀
                HStack {
                    Text("HONZAPDA\n서비스 이용을 위해\n이용약관에\n동의해주세요!")
                        .font(.sCoreDream(.bold, size: 26))
                        .foregroundStyle(.primary06)
                        .lineSpacing(12)
                    Spacer()
                } //: 타이틀
                .padding(.horizontal, 8)
                .padding(.top, 48)
                
                Spacer()
                
                // 약관 동의 버튼
                VStack(spacing: 16) {
                    ForEach(0..<3) { i in
                        let termType = termViewModel.terms[i].type
                        let termTitle = termViewModel.terms[i].title
                        let termContent = termViewModel.terms[i].content
                        
                        if termViewModel.terms[i].isTermAgree {
                            ZStack {
                                Image("background_\(termType)_term_fill")
                                HStack {
                                    Text(termTitle)
                                        .font(.sCoreDream(.extrabold, size: 18))
                                        .foregroundStyle(.primary06)
                                        .lineSpacing(8)
                                    Spacer()
                                    Image("icon_term_check_fill")
                                        .frame(width: 40, height: 40)
                                }
                                .padding(.all, 24)
                            }
                        } else {
                            ZStack {
                                Image("background_\(termType)_term")
                                    .grayscale(1)
                                HStack {
                                    Text(termTitle)
                                        .font(.sCoreDream(.extrabold, size: 18))
                                        .foregroundStyle(.gray06)
                                        .lineSpacing(8)
                                    Spacer()
                                    Image("icon_term_check")
                                        .frame(width: 40, height: 40)
                                }
                                .padding(.all, 24)
                            }
                        }
                    }
                } //: 약관 동의 버튼
                .padding(.bottom, 80)
            }
            .padding(.horizontal, 16)
            .edgesIgnoringSafeArea(.bottom)
            .background(
                Image("background_term")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
            )
            .navigationBarItems(leading: Button(
                action: {dismiss()},
                label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }))
        }
    }
}

private struct termDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let termDetailTitle: String
    let termDetailContent: String
    @Binding var isAgreeButtonClicked: Bool
    @Binding var isTermButtonClicked: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                HStack {
                    Text(termDetailTitle)
                        .font(.sCoreDream(.bold, size: 22))
                        .foregroundStyle(.primary06)
                    Spacer()
                }
                .padding(.top, 48)
                .padding(.horizontal, 16)
                
                ScrollView {
                    Text(termDetailContent)
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.gray06)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2.0)
                }
                .padding(.bottom, 16)
                .frame(height: 240)
                .padding(.horizontal, 16)
                
                Primary05Button(text: "상기 내용을 이해하였으며 동의함") {
                    isAgreeButtonClicked = true
                    isTermButtonClicked = false
                }
                .padding(.bottom, 42)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    TermView()
}
