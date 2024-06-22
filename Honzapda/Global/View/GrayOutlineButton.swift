//
//  GrayOutlineButton.swift
//  Honzapda
//
//  Created by 송영훈 on 6/8/24.
//

import SwiftUI

struct GrayOutlineButton: View {
    let title: String
    @State var isSelected = false
    @Binding var selectedCount: Int
    
    var body: some View {
        if isSelected {
            Text(title)
                .font(.sCoreDream(.medium, size: 16))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                .background(.primary05)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.5)
                        .stroke(.primary05, lineWidth: 1)
                    
                )
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .onTapGesture {
                    isSelected = false
                    selectedCount -= 1
                }
        } else {
            Text(title)
                .font(.sCoreDream(.medium, size: 16))
                .foregroundColor(.gray06)
                .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.5)
                        .stroke(.gray04, lineWidth: 1)
                )
                .frame(height: 40)
                .onTapGesture {
                    isSelected = true
                    selectedCount += 1
                }
        }
    }
}


#Preview {
    GrayOutlineButton(title: "Test")
}
