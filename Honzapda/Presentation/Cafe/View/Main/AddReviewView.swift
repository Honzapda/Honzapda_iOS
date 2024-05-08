//
//  AddReviewView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI

struct AddReviewView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                AddReviewPhotoView()
                DividerBoxView()
                
                AddVisitingDateView()
                DividerBoxView()
                
                AddRatingView()
                DividerBoxView()
                
                WriteReviewView()
                Gray04Button(text: "리뷰 게시하기", hEdgeSize: 16) {
                    print("DEBUG: 리뷰 게시하기")
                }
            }
        }
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
    @State private var isDatePickerShown = false

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text("방문 날짜 등록하기")
                    .font(.sCoreDream(.bold, size: 18))
                    .foregroundColor(.gray09)
                Spacer()
            }
            Gray02Box(horizontalPadding: 0) {
                Text("2024.02.17 방문")
                    .font(.sCoreDream(.medium, size: 14))
                    .foregroundColor(.gray05)
                    .padding(.vertical, 16)
            }
            .gesture(TapGesture().onEnded { isDatePickerShown = true })
            .sheet(isPresented: $isDatePickerShown) {
                ChoseDateView()
                // TODO: Modal 사이즈 줄이기...어케하누
            }
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    }
}

struct AddRatingView: View {
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
                    Image("Cafe/rating_star")
                    Image("Cafe/rating_star")
                    Image("Cafe/rating_star")
                    Image("Cafe/rating_star")
                    Image("Cafe/rating_star")
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
    @State var inputText: String = ""
    
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

