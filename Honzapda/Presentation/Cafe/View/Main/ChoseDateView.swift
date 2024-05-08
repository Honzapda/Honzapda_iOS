//
//  ChoseDateView.swift
//  Honzapda
//
//  Created by 송영훈 on 5/8/24.
//

import SwiftUI

struct ChoseDateView: View {
    @State private var date = Date()

    var body: some View {
        VStack(spacing: 16) {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .accentColor(.primary05)
            
            Primary05Button(text: "날짜 선택하기") {
                print("DEBUG: 날짜 선택하기")
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ChoseDateView()
}
