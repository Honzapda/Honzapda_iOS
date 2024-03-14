//
//  CurationTestView.swift
//  Honzapda
//
//  Created by 이재용 on 3/5/24.
//

import SwiftUI

struct CurationTestMainView: View {
    @Binding var gotoTest: Bool
    @State var progress: Int = 1
    @State var mood: String
    @State var keyword: String
    @State var menu: String
    @State var atmosphare: String
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Button(action: {
                        gotoTest = false
                        print("backButton -> gotoCuration")
                    }) {
                        Image("button_curationtest_chevron.left")
                            .padding()
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    Rectangle()
                        .frame(width: geometry.size.width * CGFloat(self.progress) / 4, height: 2)
                        .foregroundColor(Color("Primary05")) // 프로그레스 바의 색상을 설정합니다.
                }

                VStack {
                    ZStack {
                        // 프로그레스와 테스트 뷰의 순서는 일치함
                        if progress == 1 {
                            CurationTestView1(progress: $progress, mood: $mood)
                                .frame(height: UIScreen.main.bounds.height * 0.6)
                                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                        removal: .move(edge: .leading)))
                        } else if progress == 2 {
                            CurationTestView2(progress: $progress, keyword: $keyword)
                                .frame(height: UIScreen.main.bounds.height * 0.6)
                                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                        removal: .move(edge: .leading)))
                        } else if progress == 3 {
                            CurationTestView3(progress: $progress, menu: $menu)
                                .frame(height: UIScreen.main.bounds.height * 0.6)
                                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                        removal: .move(edge: .leading)))
                        } else if progress == 4 {
                            CurationTestView4(atmosphare: $atmosphare, gotoTest: $gotoTest)
                                .frame(height: UIScreen.main.bounds.height * 0.6)
                                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                        removal: .move(edge: .leading)))
                        }
                    }
                    .animation(.default, value: progress)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
