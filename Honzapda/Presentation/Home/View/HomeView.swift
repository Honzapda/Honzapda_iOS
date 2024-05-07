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
    @State private var annotations = [
        // 추후 이 부분은 set에서 가까운 위치 순으로 가져오도록 설계된다.
        // homeViewModel로부터 소팅 후 뿌린다.
        CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), title: "유저", subtitle: "중심", type: .user),
        CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.5675, longitude: 126.9785), title: "카페1", subtitle: "북동", type: .cafe),
        CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.5655, longitude: 126.9775), title: "카페2", subtitle: "남서", type: .selected)
    ]
    var body: some View {
        ZStack {
            // 지도 화면에 설정
            Map(coordinateRegion: $homeViewModel.region, annotationItems: annotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
                        Image(self.getIcon(for: annotation.type)) // 각 타입에 따라 다른 이미지
                            .foregroundColor(.blue)
                            .shadow(radius: 10)
                      
                        Text(annotation.title ?? "Unknown")
                            .font(.caption)
                    }
                }
            }
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
//                    homeViewModel.locationManager.requestCurrentLocation()
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
    func getIcon(for type: CustomAnnotation.AnnotationType) -> String {
        switch type {
        case .user: return "icon_home_myLocation_none"
        case .cafe: return "icon_home_pin_none"
        case .selected: return "icon_home_pin_fill"
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel()) // 인자 없이 HomeView를 초기화합니다.
    }
}
