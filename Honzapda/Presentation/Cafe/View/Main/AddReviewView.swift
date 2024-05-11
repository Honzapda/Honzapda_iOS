//
//  AddReviewView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI

struct AddReviewView: View {
    @State var reviewRate: Int = 0
    @State var reviewDetail: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                AddReviewPhotoView()
                DividerBoxView()
                
                AddVisitingDateView()
                DividerBoxView()
                
                AddRatingView(rating: $reviewRate)
                DividerBoxView()
                
                WriteReviewView(inputText: $reviewDetail)
                Gray04Button(text: "리뷰 게시하기", hEdgeSize: 16) {
                    print("DEBUG: 리뷰 게시하기")
                }
            }
        }
        // TODO: 뒤로가기 전에 확인 기능 추가
    }
}

struct AddReviewPhotoView: View {
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                // TODO: 사진등록은 주연님 앨범, 카메라 기능 사용 예정
                Text("리뷰 사진 등록하기 (최대 5장)")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            }
            ScrollView(.horizontal) {
                Gray02Box(whSize: [120, 120]) {
                    VStack(spacing: 12) {
                        Image(systemName: "plus")
                        Text("클릭하고\n사진 추가하기")
                            .font(.sCoreDream(.medium, size: 12))
                            .foregroundColor(.gray06)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 32, leading: 24, bottom: 40, trailing: 24))
    }
}

struct AddVisitingDateView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isDatePickerShown = false
    @State private var reviewDate: Date = Date()
    @State private var tempDate: Date = Date()
    @State private var buttonClicked: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text("방문 날짜 등록하기")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            }
            if !buttonClicked {
                Gray02Box(horizontalPadding: 0) {
                    Text("\(formatDate(date: reviewDate)) 방문")
                        .font(.sCoreDream(.medium, size: 14))
                        .foregroundColor(.gray05)
                        .padding(.vertical, 16)
                }
                .gesture(TapGesture().onEnded { isDatePickerShown = true })
                .sheet(isPresented: $isDatePickerShown) {
                    ChoseDateView(date: $reviewDate,
                                  isDatePickerShown: $isDatePickerShown,
                                  buttonClicked: $buttonClicked, 
                                  tempDate: $tempDate)
                }
            } else {
                Primary05Box(horizontalPadding: 0) {
                    Text("\(formatDate(date: reviewDate)) 방문")
                        .font(.sCoreDream(.medium, size: 14))
                        .foregroundColor(.white)
                        .padding(.vertical, 16)
                }
                .gesture(TapGesture().onEnded { isDatePickerShown = true })
                .sheet(isPresented: $isDatePickerShown) {
                    ChoseDateView(date: $reviewDate,
                                  isDatePickerShown: $isDatePickerShown,
                                  buttonClicked: $buttonClicked,
                                  tempDate: $tempDate)
                }
            }
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        return dateFormatter.string(from: date)
    }
}

struct AddRatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text("별점 등록하기")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            }
            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { number in
                        if number >= rating {
                            Image("Cafe/rating_star")
                                .gesture(TapGesture().onEnded({
                                    rating = number + 1
                                }))
                        }
                        else {
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
            }
            .padding(.horizontal, 40)
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    }
}

struct WriteReviewView: View {
    @Binding var inputText: String
    
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text("리뷰 내용 작성하기")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            }
            Gray02Box() {
                VStack {
                    CustomTextEdiotor(inputText: self.inputText,
                                      placeHolder: "리뷰는 최소 40자 이상으로 작성해주세요!\n정확한 리뷰는 다른 유저에게 큰 도움이 돼요 :)")
                    Spacer()
                    HStack {
                        Spacer()
                        Text("0/1000")
                            .foregroundColor(.gray04)
                            .font(.sCoreDream(.medium, size: 10))
                    }
                }
                .frame(height: 345)
                .padding(.vertical, 16)
                .padding(.top, 8)
                .padding(.horizontal, 24)
            }
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 24)
    }
}

#Preview {
    AddReviewView()
}
