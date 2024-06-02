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
            Color.gray03.edgesIgnoringSafeArea(.all)
            
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
                    .background(.gray03)
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
            let height = max(0, size.height + minY)
            
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
                    .frame(height: 160)
                    .clipped()
                ZStack {
                    Rectangle()
                        .frame( height: 80)
                        .foregroundColor(.white)
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("스테이 어도러블")
                                    .font(.sCoreDream(.bold, size: 16))
                                    .foregroundStyle(.gray10)
                                Text("영업 중")
                                    .font(.sCoreDream(.light, size: 8))
                                    .padding(5)
                                    .foregroundStyle(.gray08)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)  // 둥근 사각형 배경
                                            .strokeBorder(.gray08, lineWidth: 0.5)  // 테두리 색상 및 두께 지정
                                            .background(RoundedRectangle(cornerRadius: 20).fill(.white)))
                                    .foregroundColor(.white)
                                    .offset(y: -1)
                            }
                                .padding(.bottom, 8)
                            Text("경기 용인시 기흥구 죽전로43번길 15-3 1층")
                                .font(.sCoreDream(.medium, size: 10))
                                .foregroundStyle(.gray07)
                        }
                        .padding(.leading)
                        Spacer()
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}
