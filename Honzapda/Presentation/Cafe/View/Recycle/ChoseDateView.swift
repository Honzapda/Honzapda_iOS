//
//  ChoseDateView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/8/24.
//

import SwiftUI

// MARK: - 날짜 선택
struct ChoseDateView: View {
    // MARK: PARAMETER
    @Binding var date: Date
    @Binding var isDatePickerShown: Bool
    @Binding var buttonClicked: Bool
    @Binding var tempDate: Date
    @State var isTimeDisplay = false
    // MARK: BODY
    var body: some View {
        VStack(spacing: 16) {
            Rectangle()
                .foregroundColor(.gray03)
                .frame(width: 100, height: 4)
                .cornerRadius(8)
                .padding(.top, 8)
                .padding(.bottom, 4)
            if isTimeDisplay {
                DatePicker(
                    "Start Date",
                    selection: $tempDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.graphical)
                .accentColor(.primary05)
            } else {
                DatePicker(
                    "Start Date",
                    selection: $tempDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .accentColor(.primary05)
                .id(tempDate)
            }
            Primary05Button(text: "날짜 선택하기") {
                isDatePickerShown = false
                buttonClicked = true
                date = tempDate // 클릭만 한 Date -> 실제 선택한 Date
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
    } //: BODY
}
