//
//  TermView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/29/24.
//

import SwiftUI
import PopupView

// MARK: - 약관 동의 Main View
struct TermView: View {
    // MARK: PARAMS
    @Environment(\.dismiss) private var dismiss
    @StateObject var termViewModel = TermViewModel()
    @State var isTermButtonClicked = false
    
    // MARK: BODY
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
                    ForEach(0..<termViewModel.terms.count) { index in
                        let curTermType = termViewModel.terms[index].type
                        let curTermTitle = termViewModel.terms[index].title
                        let curTermAgree = termViewModel.terms[index].isTermAgree
                        
                        if curTermAgree {
                            ZStack {
                                Image("background_\(curTermType)_term_fill")
                                HStack {
                                    Text(curTermTitle)
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
                                Image("background_\(curTermType)_term")
                                    .grayscale(1)
                                HStack {
                                    Text(curTermTitle)
                                        .font(.sCoreDream(.extrabold, size: 18))
                                        .foregroundStyle(.gray06)
                                        .lineSpacing(8)
                                    Spacer()
                                    Image("icon_term_check")
                                        .frame(width: 40, height: 40)
                                }
                                .padding(.all, 24)
                                .onTapGesture {
                                    termViewModel.setCurrentTermIndex(index: index)
                                    isTermButtonClicked = true
                                }
                            }
                        }
                        
                        if index == termViewModel.terms.count - 1 {
                            if termViewModel.shoudNavigate {
                                NavigationLink(destination: SignUpEmailTypeView(),
                                               isActive: $termViewModel.shoudNavigate) {
                                    EmptyView() }
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
            .popup(isPresented: $isTermButtonClicked) {
                termDetailView(termViewModel: termViewModel,
                               isTermButtonClicked: $isTermButtonClicked)
            } customize: { $0
                .type(.toast)
                .position(.bottom)
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.5))
            }
        }
    } //: BODY
} //: 약관 동의 Main View

// MARK: - Popup되는 약관 화면
private struct termDetailView: View {
    // MARK: PARAMS
    var termViewModel: TermViewModel
    @Binding var isTermButtonClicked: Bool
    
    // MARK: BODY
    var body: some View {
        let curIndex = termViewModel.getCurrentTermIndex()
        let termDetailTitle = termViewModel.terms[curIndex].title.replacingOccurrences(of: "\n", with: "")
        let termDetailContent = termViewModel.terms[curIndex].content
        
        VStack {
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
                .frame(height: 280)
                .padding(.horizontal, 16)
                
                Primary05Button(text: "상기 내용을 이해하였으며 동의함") {
                    termViewModel.termAgree(index: curIndex)
                    termViewModel.setShoudNavigate()
                    isTermButtonClicked = false
                }
                .padding(.bottom, 42)
            }
            .padding(.horizontal, 16)
        }
        .background(
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.white)
        )
    } //: BODY
} //: Popup되는 약관 화면

#Preview {
    TermView()
}
