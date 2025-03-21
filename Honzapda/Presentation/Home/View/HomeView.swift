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
    @State var gotoDetail: Bool = false
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
            Map(coordinateRegion: Binding($homeViewModel.nowRegion) ??
                .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665,
                                                                            longitude: 126.9780),
                                             span: MKCoordinateSpan(latitudeDelta: 0.005,
                                                                    longitudeDelta: 0.005))),
                annotationItems: annotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    VStack {
                        Image(self.getIcon(for: annotation.type))
                            .frame(width: 20, height: 20)
                            .shadow(radius: 10)
                            .onTapGesture {
                                homeViewModel.cardViewisShowing.toggle()
                            }
                        
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
                //                Button {
                //                    homeViewModel.updateRegion(lat: 0.1, lon: 0.1)
                //                } label: {
                //                    Text("Changeup")
                //                }
                
            }
            .padding(.trailing)
            .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
            .offset(y: -100)
            
            if homeViewModel.cardViewisShowing {
                Carousel(pageCount: homeViewModel.sampleData.count, visibleEdgeSpace: 20,
                         spacing: 30,
                         startingIndex: 0) { idx in
                    CardView(homeViewModel: homeViewModel, dataset: homeViewModel.sampleData[idx])
                    .border(.green)
                }
                         .border(.red)
            }
            
            EmptyView() // 팝업 뷰
                .popup(isPresented: $homeViewModel.bottomSheetisShowing) {
                    HomeBottomSheetView(homeViewModel: homeViewModel)
                } customize: { view in
                    view .type(.toast)
                        .position(.bottom)
                        .dragToDismiss(true)
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
