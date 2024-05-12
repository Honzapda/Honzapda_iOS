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

    // MARK: BODY
    var body: some View {
        VStack(spacing: 16) {
            DatePicker(
                "Start Date",
                selection: $tempDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .accentColor(.primary05)
            
            Primary05Button(text: "날짜 선택하기") {
                isDatePickerShown = false
                buttonClicked = true
                date = tempDate // 클릭만 한 Date -> 실제 선택한 Date
            }
        }
        .padding(.horizontal, 16)
    } //: BODY
}
