//
//  CurationResultView.swift
//  Honzapda
//
//  Created by 이재용 on 3/5/24.
//

import SwiftUI

struct CurationResultView: View {
    @ObservedObject var curationViewModel: CurationViewModel
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    HeaderView()
                        .onAppear {
                            curationViewModel.resultPopup = true
                        }
                    ScrollView { // 결과 카페들 내역
                        VStack {
                            CurationResultCellView()
                                .padding(.top)
                            CurationResultCellView()
                                .padding(.top)
                            CurationResultCellView()
                                .padding(.top)
                            CurationResultCellView()
                                .padding(.top)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color("Gray03"))
                }
            }
            .coordinateSpace(name: "Scroll")
            .ignoresSafeArea(.container, edges: .vertical)
            
            VStack {
                HStack {
                    Button(action: {
                        print("goto curationMain")
                        curationViewModel.gotoResult = false
                    }) {
                        Image(systemName: "lessthan")
                            .resizable()
                            .frame(width: 9, height: 16)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 15)
                    Spacer()
                }
                Spacer()
            }
            .zIndex(1) // 이 버튼이 다른 모든 요소 위에 놓이도록 함
            
            if curationViewModel.resultPopup {
                CafeListPopUp(curationViewModel: curationViewModel)
            }
        }
    }
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("Scroll")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            ZStack(alignment: .topLeading) {
                Image("image_curationmain_cafesample1") // 추후 받아온 이미지로 대체
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: height, alignment: .top)
                    .clipped()
                    .overlay(content: {
                        Rectangle()
                            .opacity(0.3)
                        
                        ZStack(alignment: .topLeading) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("오늘\n내 취향에 맞는\n혼잡도 낮은 카페")
                                    .font(Font.custom("S-Core Dream", size: 24))
                                    .foregroundColor(.white)
                                
                                Text("8곳")
                                    .font(Font.custom("S-Core Dream", size: 12))
                                    .foregroundColor(.white)
                            }
                            .offset(x: -70, y: 30)
                        }
                    })
                    .offset(y: -minY)
            }
        }
        .frame(height: 250)
    }
}

struct CurationResultViewPrev: PreviewProvider {
    static var previews: some View {
        CurationResultView(curationViewModel: CurationViewModel())
        CurationResultCellView()
    }
}

struct CurationResultCellView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image("image_curationmain_cafesample1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 160)
                    .clipped()
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 80)
                        .foregroundColor(.white)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("스테이 어도러블")
                                .font(Font.custom("S-Core Dream", size: 14))
                            Text("경기 용인시 기흥구 죽전로43번길 15-3 1층")
                                .font(Font.custom("S-Core Dream", size: 8))
                        }
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                }
            }
        }
        .cornerRadius(12)
    }
}
