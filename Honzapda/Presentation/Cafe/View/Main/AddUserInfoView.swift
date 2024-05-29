//
//  AddUserInfoView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/26/24.
//

import SwiftUI
import PopupView

// MARK: - MAIN VIEW
struct AddUserInfoView: View {
    // MARK: PARAMETER
    @Environment(\.dismiss) private var dismiss
    @State private var isDatePickerShown = false
    @State private var reviewDate = Date()  // 등록 버튼을 통해 저장되는 진짜 날짜
    @State private var tempDate = Date()    // DatePicker에서 눌리는 날짜를 저장
    // 버튼 활성 조건들
    @State private var isAddReviewDateButtonClicked = false
    @State private var isComponentsFilled = Array(repeating: false, count: 8) // 질문1 ~ 질문8 까지 등록 여부 체크
    @State private var isPostButtonClicked = false
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            ScrollView {
                AddVisitDateAndTimeView(isDatePickerShown: $isDatePickerShown,
                                        addDateButtonClicked: $isAddReviewDateButtonClicked,
                                        reviewDate: $reviewDate)
                
                DividerBoxView()
                
                AddInfoView(isConditionTure: $isComponentsFilled)
                
                // 포스팅 버튼
                if isConditionFilled() { // CASE 1: 포스팅 내용이 입력됐을 때
                    Primary05Button(text: "정보 작성 완료하기") { isPostButtonClicked = true }
                    .padding(.all, 16)
                } else { // CASE 2: 포스팅 내용이 채워지지 않았을 때
                    Gray04Button(text: "정보 작성 완료하기") { print("정보 작성 완료하기") }
                    .padding(.all, 16)
                }
            }
            
            // 날짜 선택 half modal
            .popup(isPresented: $isDatePickerShown) {
                ChoseDateView(date: $reviewDate,
                              isDatePickerShown: $isDatePickerShown,
                              buttonClicked: $isAddReviewDateButtonClicked,
                              tempDate: $tempDate,
                              isTimeDisplay: true)
                .background(.white)
                .cornerRadius(12)
            } customize: { $0
                .type(.toast)
                .position(.bottom)
                .closeOnTap(false)
                .backgroundColor(.black.opacity(0.5))
            } //: 날짜 선택 half modal
            
            // 리뷰 게시하기 팝업
            .popup(isPresented: $isPostButtonClicked) {
                WhitePopupBox(popupData: .smileTitleWithTwoButton(
                    "리뷰 작성을 완료하시겠어요?",
                    "조금 더 작성하기",
                    "완료하기", {
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
        } //: NAVIGATIONVIEW
    } //: BODY
    
    // MARK: FUNCTION
    private func isConditionFilled() -> Bool {
        if isAddReviewDateButtonClicked && !isComponentsFilled.contains(false) {
            return true
        }
        return false
    }
} //: MAIN VIEW

// MARK: - 방문 날짜 등록 View
private struct AddVisitDateAndTimeView: View {
    // MARK: PARAMETER
    @Binding var isDatePickerShown: Bool    // 팝업 여부 체크
    @Binding var addDateButtonClicked: Bool
    @Binding var reviewDate: Date    // 버튼을 클릭하여 선택한 Date
    
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
            if !addDateButtonClicked { // CASE 1: 날짜 등록 기록 없을 때 -> 회색 버튼
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
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
    } //: BODY
    
    // MARK: FUNCTION
    // Date 양식 수정
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd HH시"
        
        return dateFormatter.string(from: date)
    } //: Date 양식 수정
} //: 방문 날짜 등록 VIEW

// MARK: - 정보 추가하기 VIEW
private struct AddInfoView: View {
    // MARK: PARAMETER
    @Binding var isConditionTure: [Bool]
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 16) {
            // 타이틀
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
            } //: 타이틀
            
            // 다중 질문 리스트
            PercentTypeQuestionView(title: "Q. 카페가 얼마나 혼잡한가요?",
                                    isConditionTure: $isConditionTure[0])
            OptionTypeQuestionView(title: "Q. 앉았던 책상은 어떻게 느껴졌나요?",
                                   firstButtonTitle: "넓었어요", secondButtonTitle: "적당했어요", thirdButtonTitle: "좁았어요",
                                   isConditionTure: $isConditionTure[1])
            OptionTypeQuestionView(title: "Q. 콘센트 개수는 어떻게 느껴졌나요?",
                                   firstButtonTitle: "넉넉했어요", secondButtonTitle: "적당했어요", thirdButtonTitle: "부족했어요",
                                   isConditionTure: $isConditionTure[2])
            TextTypeQuestionView(title: "Q. 콘센트는 주로 어디에 있었나요?",
                                 leadingText: "주로",
                                 trailingText: "에 있어요",
                                 placeHolder: "ex) 책상 밑, 책상 위",
                                 isConditionTure: $isConditionTure[3])
            TextTypeQuestionView(title: "Q. 화장실은 어디에 있었나요?",
                                 leadingText: "화장실은",
                                 trailingText: "에 있어요",
                                 placeHolder: "ex) 1층 카운터 옆",
                                 isConditionTure: $isConditionTure[4])
            TextTypeQuestionView(title: "Q. 카페에서 어떤 종류의 노래가 많이 나왔나요?",
                                 leadingText: "노래는",
                                 trailingText: "음악이 많이 나와요",
                                 placeHolder: "ex) 케이팝, 재즈",
                                 isConditionTure: $isConditionTure[5])
            OptionTypeQuestionView(title: "Q. 카페 조명은 어떻게 느껴졌나요?",
                                   firstButtonTitle: "밝았어요", secondButtonTitle: "적당했어요", thirdButtonTitle: "어두웠어요",
                                   isConditionTure: $isConditionTure[6])
            TextTypeQuestionView(title: "Q. 카페의 전체적인 분위기는 어떻게 느껴졌나요?",
                                 leadingText: "",
                                 trailingText: "분위기",
                                 placeHolder: "ex) 조용한",
                                 isConditionTure: $isConditionTure[7])
            //: 다중 질문 리스트
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
    } //: BODY
} //: 정보 추가하기 VIEW

// MARK: - 퍼센트 선택 타입 질문 VIEW
private struct PercentTypeQuestionView: View {
    // MARK: PARAMETER
    let title: String!
    @State var selectedPercent: Int?    // 0 to 10
    @Binding var isConditionTure: Bool
    
    // MARK: BODY
    var body: some View {
        Gray02Box {
            VStack(spacing: 16) {
                // 타이틀
                HStack() {
                    Text(title)
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray09)
                    Spacer()
                } //: 타이틀
                
                VStack(spacing: 8) {
                // 퍼센트 선택 바
                    HStack {
                        ForEach(0..<10) { number in
                            if number == selectedPercent {
                                Circle()
                                    .stroke(.primary05, lineWidth: 1)
                                    .background(.primary05)
                                    .clipShape(.circle)
                                    .frame(width: 12, height: 12)
                            }
                            else {
                                Circle()
                                    .stroke(.primary05, lineWidth: 1)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .frame(width: 12, height: 12)
                                    .gesture(TapGesture().onEnded({
                                        selectedPercent = number
                                        isConditionTure = true
                                    }))
                            }
                            if number != 9 {
                                Spacer()
                            }
                        }
                    }
                    .background(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.primary05)
                    )
                     //: 퍼센트 선택 바
                    
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
    } //: BODY
} //: 퍼센트 선택 타입 질문 VIEW

// MARK: - 3 OPTION 선택형 질문 VIEW
private struct OptionTypeQuestionView: View {
    // MARK: PARAMETER
    let title: String
    let firstButtonTitle: String
    let secondButtonTitle: String
    let thirdButtonTitle: String
    @State private var isFirstOptionSelected = false    // 버튼 선택여부 확인
    @State private var isSecondOptionSelected = false
    @State private var isThirdOptionSelected = false
    @State var isRemenberBtnSelected = false    // 기억나지 않아요 버튼 체크 여부
    @Binding var isConditionTure: Bool  // 질문이 등록됐는지 여부 체크
    
    // MARK: BODY
    var body: some View {
        Gray02Box {
            VStack(alignment: .leading, spacing: 16) {
                // 타이틀
                HStack() {
                    Text(title)
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray09)
                    Spacer()
                } //: 타이틀
                
                // 3개 선택지
                HStack(spacing: 8) {
                    OptionQuestionButton(buttonTitle: firstButtonTitle,
                                         isButtonSelected: $isFirstOptionSelected)
                        .gesture(TapGesture().onEnded({ buttonToggle(1) }))
                    OptionQuestionButton(buttonTitle: secondButtonTitle,
                                         isButtonSelected: $isSecondOptionSelected)
                        .gesture(TapGesture().onEnded({ buttonToggle(2) }))
                    OptionQuestionButton(buttonTitle: thirdButtonTitle,
                                         isButtonSelected: $isThirdOptionSelected)
                        .gesture(TapGesture().onEnded({ buttonToggle(3) }))
                } //: 3개 선택지
                
                // 기억나지 않아요 버튼
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
                        buttonToggle(0)
                    }))
                    Text("기억나지 않아요")
                        .font(.sCoreDream(.medium, size: 10))
                        .foregroundStyle(.gray08)
                    Spacer()
                } //: 기억나지 않아요 버튼
            }
            .padding(.all, 24)
        }
    } //: BODY
    
    // MARK: FUNCTION
    // 4개중 하나만 On 설정 함수
    func buttonToggle(_ buttonNumber: Int) {
        isRemenberBtnSelected = buttonNumber == 0 ? true : false
        isFirstOptionSelected = buttonNumber == 1 ? true : false
        isSecondOptionSelected = buttonNumber == 2 ? true : false
        isThirdOptionSelected = buttonNumber == 3 ? true : false
        isConditionTure = true
    }
} //: 3 OPTION 선택형 질문 VIEW

// MARK: - TEXT 입력 타입의 질문 VIEW
private struct TextTypeQuestionView: View {
    // MARK: PARAMETER
    let title: String
    let leadingText: String // 머릿말
    let trailingText: String    // 꼬릿말
    let placeHolder: String // 입력칸 예시
    @State var isRemenberBtnSelected = false
    @State private var inputText  = ""  // 입력된 내용
    @Binding var isConditionTure: Bool  // 질문에 내용 등록 여부 체크
    
    // MARK: BODY
    var body: some View {
        Gray02Box {
            VStack(spacing: 16) {
                // 타이틀
                HStack() {
                    Text(title)
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray09)
                    Spacer()
                } //: 타이틀
                
                HStack(alignment: .bottom, spacing: 8) {
                    if leadingText != "" { // 맨 첫 문장이 있는 경우
                        Text(leadingText)
                            .font(.sCoreDream(.medium, size: 12))
                            .foregroundStyle(.gray09)
                    }
                    // 입력창
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
                        .onChange(of: inputText) { _ in
                            if inputText != "" {
                                isRemenberBtnSelected = false
                                isConditionTure = checkCondition()
                            }
                            else { isConditionTure = checkCondition() }
                        }
                        
                        Rectangle()
                            .fill(.gray03)
                            .frame(maxWidth: 135, maxHeight: 1)
                    } //: 입력창
                    
                    Text(trailingText)
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.gray09)
                    
                    Spacer()
                }
                // 기억나지 않아요 버튼
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
                        isConditionTure = checkCondition()
                        
                        if isRemenberBtnSelected == true {
                            inputText = ""
                        }
                    }))
                    Text("기억나지 않아요")
                        .font(.sCoreDream(.medium, size: 10))
                        .foregroundStyle(.gray08)
                    Spacer()
                } //: 기억나지 않아요 버튼
            }
            .padding(.all, 24)
        }
    } //: BODY
    
    // MARK: FUNCTION
    // 입력 완료 상태 확인
    func checkCondition() -> Bool {
        return inputText == "" && !isRemenberBtnSelected ? false : true
    }
} //: TEXT 입력 타입의 질문 VIEW

// MARK: - OPTION 선택 버튼 VIEW
private struct OptionQuestionButton: View {
    // MARK: PARAMETER
    let buttonTitle: String
    @Binding var isButtonSelected: Bool
    
    // MARK: BODY
    var body: some View {
        if isButtonSelected {
            Text(buttonTitle)
                .font(.sCoreDream(.medium, size: 12))
                .foregroundStyle(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(.primary05)
                .cornerRadius(24)
        } else {
            Text(buttonTitle)
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
    } //: BODY
} //: OPTION 선택 버튼 VIEW

#Preview {
    AddUserInfoView()
}
