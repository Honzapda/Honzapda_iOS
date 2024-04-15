//
//  HomeViewModel.swift
//  Honzapda
//
//  Created by 이재용 on 2/29/24.
//
import SwiftUI

import Combine
import MapKit

class HomeViewModel: ObservableObject {
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()
    // 현재 위치를 로케이션 매니저에서 입력받음
    @Published var bottomSheetisShowing: Bool = false // 바텀시트의 온오프 관리
    // ToDo: 자료구조 추가되어야 하는 것
    @Published var honzapdaCafeSet = Set<HonzapdaCafe>() // 중복 제거를 위해서 set으로 설정함. -> 이걸로 지도도 찍고, 카드뷰도 만들고, 바텀시트도 만듬
    @Published var honzapdaCafeArr: [HonzapdaCafe] = []
    
    var locationManager: LocationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        locationManager.$region
            .sink { [weak self] newRegion in
                self?.region = newRegion
            }
            .store(in: &cancellables) // 이제 locationManager의 region을 안전하게 구독할 수 있습니다.
    }
    
    // ToDo : 함수 추가되어야 하는 것
    
    func postSavedCafe(id: Int) {
        // 카페저장 api를 호출하여 id에 해당하는 카페를 서버에 저장한다.
        // 호출 위치: home의 카드 뷰의 깃발 (토글)
        
        
    }
    
    func deleteSavedCafe(id: Int) {
        // 저장된 카페 삭제 api호출, id에 해당하는 카페를 서버에서 삭제한다.
        // 호출 위치: home의 카드 뷰의 깃발(토글)
    }

    func getSavedCafe() {
        // 저장된 카페 조회 api호출, 저장된 카페를 서버에서 가져온다
        // 호출 위치: 홈화면 진입시, 저장된 카페 바텀시트 호출 시
        
    }
    func postCafeAround() {
        // 현재 좌표에 기반하여 저장된 카페를 서버에서 가져온다. 화면을움직여서 해당 좌표를 기반으로 호출
        // 호출 위치: 홈 진입시, 호출
    }
    
    
    
}
