//
//  AddUserInfoView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/26/24.
//

import SwiftUI

// MARK: - MAIN VIEW
struct AddUserInfoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                AddVisitDateAndTimeView()
                DividerBoxView()
                
                AddInfoView()
                Gray04Button(text: "정보 작성 완료하기") {
                    print("정보 작성 완료하기")
                }
                .padding(.all, 16)
            }
        }
    }
} //: MAIN VIEW

// MARK: - 방문 날짜 등록 View
private struct AddVisitDateAndTimeView: View {
    // MARK: PARAMETER
    @State private var addReviewDateButtonClicked = false
    @State private var isDatePickerShown = false    // 팝업 여부 체크
    @State private var reviewDate = Date()    // 버튼을 클릭하여 선택한 Date
    @State private var tempDate = Date()  // 단순 날짜만 선택한 경우 Date
    
    // MARK: BODY
    var body: some View {
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
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
        
    }
    
    // MARK: FUNCTION
    // Date 양식 수정
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd HH시"
        
        return dateFormatter.string(from: date)
    } //: Date 양식 수정
} //: 방문 날짜 등록 VIEW

private struct AddInfoView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                HStack {
                    Text("정보 등록하기")
                        .font(.sCoreDream(.bold, size: 18))
                        .foregroundColor(.gray09)
                    Spacer()
                }
                HStack {
                    Text("등록해주시는 정보는 다른 유저들에게 큰 힘이 돼요! \n최대한 정확하게 작성해주세요 :)")
                        .font(.sCoreDream(.medium, size: 11))
                        .foregroundColor(.gray06)
                    Spacer()
                }
            }
            // MARK: 다중 질문 리스트
            PercentTypeQuestionView(title: "Q. 카페가 얼마나 혼잡한가요?")
            OptionTypeQuestionView(title: "Q. 앉았던 책상은 어떻게 느껴졌나요?",
                                   btn1Title: "넓었어요", btn2Title: "적당했어요", btn3Title: "좁았어요")
            OptionTypeQuestionView(title: "Q. 콘센트 개수는 어떻게 느껴졌나요?",
                                   btn1Title: "넉넉했어요", btn2Title: "적당했어요", btn3Title: "부족했어요")
            TextTypeQuestionView(title: "Q. 콘센트는 주로 어디에 있었나요?",
                                 leadingText: "주로",
                                 trailingText: "에 있어요",
                                 placeHolder: "ex) 책상 밑, 책상 위")
            TextTypeQuestionView(title: "Q. 화장실은 어디에 있었나요?",
                                 leadingText: "화장실은",
                                 trailingText: "에 있어요",
                                 placeHolder: "ex) 1층 카운터 옆")
            TextTypeQuestionView(title: "Q. 카페에서 어떤 종류의 노래가 많이 나왔나요?",
                                 leadingText: "노래는",
                                 trailingText: "음악이 많이 나와요",
                                 placeHolder: "ex) 케이팝, 재즈")
            OptionTypeQuestionView(title: "Q. 카페 조명은 어떻게 느껴졌나요?",
                                   btn1Title: "밝았어요", btn2Title: "적당했어요", btn3Title: "어두웠어요")
            TextTypeQuestionView(title: "Q. 카페의 전체적인 분위기는 어떻게 느껴졌나요?",
                                 leadingText: "",
                                 trailingText: "분위기",
                                 placeHolder: "ex) 조용한")
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
    }
}

// MARK: - 퍼센트 선택 타입 질문 VIEW
private struct PercentTypeQuestionView: View {
    let title: String!
    @State var selectedPercent: Int?    // 0 to 10
    
    var body: some View {
        Gray02Box {
            VStack(spacing: 16) {
                HStack() {
                    Text(title)
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray09)
                    Spacer()
                }
                VStack(spacing: 8) {
                    ZStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.primary05)
                        HStack(spacing: 20) {
                            ForEach(0..<10) { number in
                                if number == selectedPercent {
                                    Circle()
                                        .stroke(.primary05, lineWidth: 1)
                                        .background(.primary05)
                                        .clipShape(.circle)
                                        .frame(width: 12, height: 12)
                                        .gesture(TapGesture().onEnded({
                                            selectedPercent = number
                                        }))
                                }
                                else {
                                    Circle()
                                        .stroke(.primary05, lineWidth: 1)
                                        .background(.white)
                                        .clipShape(.circle)
                                        .frame(width: 12, height: 12)
                                        .gesture(TapGesture().onEnded({
                                            selectedPercent = number
                                        }))
                                }
                            }
                        }
                    }
                    HStack {
                        Text("0%")
                            .font(.sCoreDream(.medium, size: 8))
                            .foregroundStyle(.gray06)
                        Spacer()
                        Text("100%")
                            .font(.sCoreDream(.medium, size: 8))
                            .foregroundStyle(.gray06)
                    }
                }
            }
            .padding(.all, 24)
        }
    }
} //: 퍼센트 선택 타입 질문 VIEW

// MARK: - 3 OPTION 선택형 질문 VIEW
private struct OptionTypeQuestionView: View {
    let title: String!
    let btn1Title: String
    let btn2Title: String
    let btn3Title: String
    @State private var isOption1Selected = false
    @State private var isOption2Selected = false
    @State private var isOption3Selected = false
    @State var isRemenberBtnSelected = false
    
    
    var body: some View {
        Gray02Box {
            VStack(alignment: .leading, spacing: 16) {
                HStack() {
                    Text(title)
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray09)
                    Spacer()
                }
                HStack(spacing: 8) {
                    Text(btn1Title)
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.primary05)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.white)
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .inset(by: 0.5)
                                .stroke(.primary05, lineWidth: 1)
                        )
                    Text(btn2Title)
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.primary05)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.white)
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .inset(by: 0.5)
                                .stroke(.primary05, lineWidth: 1)
                        )
                    Text(btn3Title)
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.primary05)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(.white)
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .inset(by: 0.5)
                                .stroke(.primary05, lineWidth: 1)
                        )
                }
                HStack(spacing: 4) {
                    ZStack {
                        Circle()
                            .stroke(.primary05, lineWidth: 1)
                            .background(.white)
                            .clipShape(.circle)
                            .frame(width: 12, height: 12)
                        if isRemenberBtnSelected {
                            Circle()
                                .stroke(.primary05, lineWidth: 1)
                                .background(.primary05)
                                .clipShape(.circle)
                                .frame(width: 8, height: 8)
                        }
                    }
                    .gesture(TapGesture().onEnded({
                        isRemenberBtnSelected.toggle()
                        
                    }))
                    Text("기억나지 않아요")
                        .font(.sCoreDream(.medium, size: 10))
                        .foregroundStyle(.gray08)
                    Spacer()
                }
            }
            .padding(.all, 24)
        }
    }
} //: 3 OPTION 선택형 질문 VIEW

// MARK: - TEXT 입력 타입의 질문 VIEW
private struct TextTypeQuestionView: View {
    let title: String
    let leadingText: String
    let trailingText: String
    let placeHolder: String
    @State var isRemenberBtnSelected = false
    @State private var inputText  = ""
    
    var body: some View {
        Gray02Box {
            VStack(spacing: 16) {
                HStack() {
                    Text(title)
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray09)
                    Spacer()
                }
                HStack(alignment: .bottom, spacing: 8) {
                    if leadingText != "" {
                        Text(leadingText)
                            .font(.sCoreDream(.medium, size: 12))
                            .foregroundStyle(.gray09)
                    }
                    VStack(spacing: 4) {
                        TextField(text: $inputText) {
                            Text(placeHolder)
                                .font(.sCoreDream(.medium, size: 12))
                                .foregroundStyle(.gray06)
                        }
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.gray09)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 135)
                        
                        Rectangle()
                            .fill(.gray03)
                            .frame(maxWidth: 135, maxHeight: 1)
                    }
                    Text(trailingText)
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.gray09)
                    
                    Spacer()
                }
                HStack(spacing: 4) {
                    ZStack {
                        Circle()
                            .stroke(.primary05, lineWidth: 1)
                            .background(.white)
                            .clipShape(.circle)
                            .frame(width: 12, height: 12)
                        if isRemenberBtnSelected {
                            Circle()
                                .stroke(.primary05, lineWidth: 1)
                                .background(.primary05)
                                .clipShape(.circle)
                                .frame(width: 8, height: 8)
                        }
                    }
                    .gesture(TapGesture().onEnded({
                        isRemenberBtnSelected.toggle()
                        
                    }))
                    Text("기억나지 않아요")
                        .font(.sCoreDream(.medium, size: 10))
                        .foregroundStyle(.gray08)
                    Spacer()
                }
            }
            .padding(.all, 24)
        }
    }
} //: TEXT 입력 타입의 질문 VIEW

#Preview {
    AddUserInfoView()
}

