//
//  SignUpTitle.swift
//  Honzapda
//
//  Created by 송영훈 on 6/8/24.
//

import SwiftUI

struct SignUpTitle: View {
    let firstHightlightText: String
    let firstNormalText: String
    let secondHightlightText: String
    let secondNormalText: String
    let thirdHightlightText: String
    let thirdNormalText: String
    var body: some View {
        (Text(firstHightlightText)
            .font(.sCoreDream(.bold, size: 26))
        + Text(firstNormalText)
            .font(.sCoreDream(.medium, size: 26))
        + Text(secondHightlightText)
            .font(.sCoreDream(.bold, size: 26))
        + Text(secondNormalText)
            .font(.sCoreDream(.medium, size: 26))
        + Text(thirdHightlightText)
            .font(.sCoreDream(.bold, size: 26))
        + Text(thirdNormalText)
            .font(.sCoreDream(.medium, size: 26))
        )
        .foregroundStyle(.primary06)
        .lineSpacing(12)
    }
}

#Preview {
    SignUpTitle(firstHightlightText: "Test1", firstNormalText: "Test1",
                secondHightlightText: "Test2", secondNormalText: "Test2",
                thirdHightlightText: "Test3", thirdNormalText: "Test3")
}
