//
//  ChoseDateView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/8/24.
//

import SwiftUI

struct ChoseDateView: View {
    @Binding var date: Date
    @Binding var isDatePickerShown: Bool
    @Binding var buttonClicked: Bool
    @Binding var tempDate: Date

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
                date = tempDate
            }
        }
        .padding(.horizontal, 16)
    }
}
