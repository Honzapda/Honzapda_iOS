//
//  HomeEntity.swift
//  Honzapda
//
//  Created by YOUJIM on 2/28/24.
//

import SwiftUI

import MapKit

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel // 홈 뷰 모델 지향
    @GestureState private var dragOffset = CGSize.zero // 드래그제스쳐 관리
    @State private var bias: CGFloat = 0
    var body: some View {
        ZStack {
            // 지도 화면에 설정
            Map(coordinateRegion: $homeViewModel.region)
                .ignoresSafeArea()
            
            VStack { // 세이브 버튼, 내 위치 버튼 설정
                Button {// 세이브 버튼
                    print("save button tap")
                    homeViewModel.bottomSheetisShowing.toggle()
                } label: {
                    Image("icon_home_saveButton_none")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                
                Button { // 내 위치 버튼
                    print("center button tap")
                    homeViewModel.locationManager.requestCurrentLocation()
                } label: {
                    Image("icon_home_locationButton_none")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            .padding(.trailing)
            .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
            .offset(y: -100)
            
            if homeViewModel.bottomSheetisShowing { // 바텀시트 온오프
                HomeBottomSheetView(homeViewModel: homeViewModel)
                    .zIndex(3)
                    .transition(.move(edge: .bottom))
                    .offset(y: UIScreen.main.bounds.height/2 + bias)
                    .gesture(
                        DragGesture()
                            .updating($dragOffset) { value, state, _ in
                                state = value.translation
                                bias = state.height
                            }
                            .onEnded { value in
                                if value.translation.height > 50 { // 드래그 길이가 50보다 크면 화면을 숨깁니다.
                                    withAnimation {
                                        homeViewModel.bottomSheetisShowing = false
                                    }
                                } else if value.translation.height < -50 {
                                    withAnimation {
                                        bias = -UIScreen.main.bounds.height/2
                                    }
                                }
                            }
                    )
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel()) // 인자 없이 HomeView를 초기화합니다.
    }
}
