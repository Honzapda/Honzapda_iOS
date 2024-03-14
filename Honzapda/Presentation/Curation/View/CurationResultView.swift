//
//  CurationResultView.swift
//  Honzapda
//
//  Created by 이재용 on 3/5/24.
//

import SwiftUI

struct CurationResultView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HeaderView()
                ScrollView {
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
    }
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("Scroll")).minY
            let size = proxy.size
            let height = (size.height + minY)
            ZStack {
                Image("image_curationmain_cafesample1") // 추후 받아온 이미지로 대체
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: height, alignment: .top)
                    .clipped()
                    .overlay(content: {
                        Rectangle()
                            .opacity(0.3)
                        ZStack(alignment: .bottomLeading) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("오늘\n내 취향에 맞는\n혼잡도 낮은 카페")
                                    .font(Font.custom("S-Core Dream", size: 24))
                                    .foregroundColor(.white)
                                Text("8곳")
                                    .font(Font.custom("S-Core Dream", size: 12))
                                    .foregroundColor(.white)
                            }
                            .offset(x: -70, y: 30)
                            // .border(Color.red)
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
        CurationResultView()
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
                        VStack(alignment: .leading){
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
