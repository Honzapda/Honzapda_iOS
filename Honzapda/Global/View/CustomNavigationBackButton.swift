//
//  CustomNavigationBackButton.swift
//  Honzapda
//
//  Created by 송영훈 on 6/8/24.
//

import SwiftUI

// MARK: - Navigation back button custom
struct CustomNavigationBackButton: View {
    let color: Color
    let title: String
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Image(.iconChevronLeft) // '<' Image
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundStyle(.black)
            }
        }
    }
} //: Navigation back button custom
