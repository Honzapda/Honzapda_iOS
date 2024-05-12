//
//  AddReviewView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI
import PopupView

// MARK: - 메인
struct AddReviewView: View {
    // MARK: PARAMETER
    @State private var addReviewDateButtonClicked = false   // 날짜 선택하기 버튼 클릭 여부
    @State private var reviewRate = 0
    @State private var reviewDetail = ""    // 리뷰 작성 내용
    @State private var isPostButtonClicked = false
    @Environment(\.dismiss) private var dismiss
    
    // AddVisitingDate PARAMS
    @State private var isDatePickerShown = false    // 팝업 여부 체크
    @State private var reviewDate: Date = Date()    // 버튼을 클릭하여 선택한 Date
    @State private var tempDate: Date = Date()  // 단순 날짜만 선택한 경우 Date
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            ScrollView {
                AddReviewPhotoView()
                DividerBoxView()
                
                // MARK: 방문 날짜 등록 View
                VStack(spacing: 24) {
                    // 타이틀
                    HStack {
                        Text("방문 날짜 등록하기")
                            .font(.sCoreDream(.bold, size: 18))
                            .foregroundColor(.gray09)
                        Spacer()
                    } //: 타이틀
                    
                    // 방문 날짜 등록 버튼
                    if !addReviewDateButtonClicked { // CASE 1: 날짜 등록 기록 없을 때 -> 회색 버튼
                        Gray02Box(horizontalPadding: 0) {
                            Text("\(formatDate(date: reviewDate)) 방문")
                                .font(.sCoreDream(.medium, size: 14))
                                .foregroundColor(.gray05)
                                .padding(.vertical, 16)
                        }
                        .gesture(TapGesture().onEnded { isDatePickerShown = true })
                    } else { // CASE 2: 날짜 등록 기록 있을 때 -> Primary 버튼
                        Primary05Box(horizontalPadding: 0) {
                            Text("\(formatDate(date: reviewDate)) 방문")
                                .font(.sCoreDream(.medium, size: 14))
                                .foregroundColor(.white)
                                .padding(.vertical, 16)
                        }
                        .gesture(TapGesture().onEnded { isDatePickerShown = true })
                    } //: 방문 날짜 등록 버튼
                } //: 방문 날짜 등록 View
                .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
                DividerBoxView()
                
                AddRatingView(rating: $reviewRate)
                DividerBoxView()
                
                WriteReviewView(inputText: $reviewDetail)
                
                // 리뷰 게시하기 버튼
                if addReviewDateButtonClicked &&
                    reviewRate != 0 &&
                    reviewDetail.count >= 40 { // CASE 1: 게시 조건 달성 -> Primary 버튼
                    Primary05Button(text: "리뷰 게시하기", hEdgeSize: 16) { isPostButtonClicked = true
                    }
                } else { // CASE 2: 게시 조건 미달 -> 회색 버튼
                    Gray04Button(text: "리뷰 게시하기", hEdgeSize: 16) {}
                }
                //: 리뷰 게시하기 버튼
            }
        }
        // MARK: 날짜 선택 half modal
        .popup(isPresented: $isDatePickerShown) {
            ChoseDateView(date: $reviewDate,
                          isDatePickerShown: $isDatePickerShown,
                          buttonClicked: $addReviewDateButtonClicked,
                          tempDate: $tempDate)
            .background(.white)
            .cornerRadius(12)
        } customize: { $0
            .type(.toast)
            .position(.bottom)
            .closeOnTap(false)
            .backgroundColor(.black.opacity(0.5))
        } //: 날짜 선택 half modal
        
        // MARK: 리뷰 게시하기 팝업
        .popup(isPresented: $isPostButtonClicked) {
            WhitePopupBox(popupData: .smileTitleWithTwoButton("리뷰 작성을 완료하시겠어요?",
                                                              "조금 더 작성하기",
                                                              "완료하기",
                                                              {
                isPostButtonClicked = false
            }, {
                // TODO: 데이터 전송하기
                dismiss()
            }))
        } customize: { $0
            .dragToDismiss(false)
            .closeOnTap(false)
            .backgroundColor(.black.opacity(0.5))
        } //: 리뷰 게시하기 팝업
        
        // TODO: 뒤로가기 전에 확인 기능 추가
    } //: BODY
    
    // MARK: FUNCTION
    // Date 양식 수정
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        return dateFormatter.string(from: date)
    } //: Date 양식 수정
} //: 메인

// MARK: - 리뷰 사진 등록
struct AddReviewPhotoView: View {
    // MARK: BODY
    var body: some View {
        VStack(spacing: 24) {
            // 타이틀
            HStack {
                Text("리뷰 사진 등록하기 (최대 5장)")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            } //: 타이틀
            
            // 사진 등록
            ScrollView(.horizontal) {
                Gray02Box(whSize: [120, 120]) {
                    VStack(spacing: 12) {
                        // TODO: 사진등록은 주연님 앨범, 카메라 기능 사용 예정
                        Image(systemName: "plus")
                        Text("클릭하고\n사진 추가하기")
                            .font(.sCoreDream(.medium, size: 12))
                            .foregroundColor(.gray06)
                            .multilineTextAlignment(.center)
                    }
                }
            } //: 사진 등록
        }
        .padding(EdgeInsets(top: 32, leading: 24, bottom: 40, trailing: 24))
    } //: BODY
} //: 리뷰 사진 등록

// MARK: - 별점 등록하기
struct AddRatingView: View {
    // MARK: PARAMETER
    @Binding var rating: Int
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 24) {
            // 타이틀
            HStack {
                Text("별점 등록하기")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            } //: 타이틀
            
            // 별점 등록하기
            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { number in
                        if number >= rating {
                            Image("Cafe/rating_star")
                                .gesture(TapGesture().onEnded({
                                    rating = number + 1
                                }))
                        } else {
                            Image("Cafe/rating_star_fill")
                                .gesture(TapGesture().onEnded({
                                    rating = number + 1
                                }))
                        }
                    }
                }
                HStack {
                    Text("0점")
                        .foregroundColor(.gray06)
                        .font(.sCoreDream(.medium, size: 10))
                    Spacer()
                    Text("5점")
                        .foregroundColor(.gray06)
                        .font(.sCoreDream(.medium, size: 10))
                }
            } //: 별점 등록하기
            .padding(.horizontal, 40)
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    } //: BODY
} //: 별점 등록하기

// MARK: - 리뷰 내용 작성하기
struct WriteReviewView: View {
    // MARK: PARAMETER
    @Binding var inputText: String
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 24) {
            // 타이틀
            HStack {
                Text("리뷰 내용 작성하기")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            } //: 타이틀
            
            // 텍스트 입력창
            Gray02Box() {
                VStack {
                    CustomTextEdiotor(inputText: self.$inputText,
                                      placeHolder: "리뷰는 최소 40자 이상으로 작성해주세요!\n정확한 리뷰는 다른 유저에게 큰 도움이 돼요 :)")
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(self.inputText.count)/1000")
                            .foregroundColor(.gray04)
                            .font(.sCoreDream(.medium, size: 10))
                    }
                }
                .frame(height: 345)
                .padding(.vertical, 16)
                .padding(.top, 8)
                .padding(.horizontal, 24)
            } //: 텍스트 입력창
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 24)
    } //: BODY
} //: 리뷰 내용 작성하기

// MARK: - 프리뷰
#Preview {
    AddReviewView()
} //: 프리뷰
