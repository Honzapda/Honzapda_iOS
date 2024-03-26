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
    
    var locationManager: LocationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()
    var honzapdaCafeSet = Set<HonzapdaCafe>()
    init() {
        locationManager.$region
            .sink { [weak self] newRegion in
                self?.region = newRegion
            }
            .store(in: &cancellables) // 이제 locationManager의 region을 안전하게 구독할 수 있습니다.
    }

}
