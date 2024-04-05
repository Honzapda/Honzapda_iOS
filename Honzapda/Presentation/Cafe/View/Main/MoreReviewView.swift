//
//  MoreReview.swift
//  Honzapda
//
//  Created by 송영훈 on 4/1/24.
//

import SwiftUI

struct MoreReviewView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
        }
        .toolbar {
            Button("Add") {
                print("Heart button")
            }
        }
    }
    // TODO: Navibar right button
}

#Preview {
    MoreReviewView()
}
