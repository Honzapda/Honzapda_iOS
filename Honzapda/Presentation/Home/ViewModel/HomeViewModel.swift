//
//  HomeViewModel.swift
//  Honzapda
//
//  Created by 이재용 on 2/29/24.
//
import SwiftUI

import Combine
import MapKit

//@MainActor
class HomeViewModel: ObservableObject {
    @Published var nowRegion: MKCoordinateRegion?
// coreLocation -> homeviewmodel -> nowRegion -> 홈뷰 로의 데이터 흐름 단일화 
    // 현재 위치를 로케이션 매니저에서 입력받음
    @Published var bottomSheetisShowing: Bool = false // 바텀시트의 온오프 관리
    @Published var cardViewisShowing: Bool = false // 카드 뷰의 온오프 관리
    // ToDo: 자료구조 추가되어야 하는 것
    @Published var honzapdaCafeSet = Set<HonzapdaCafe>() // 중복 제거를 위해서 set으로 설정함. -> 이걸로 지도도 찍고, 카드뷰도 만들고, 바텀시트도 만듬
    @Published var honzapdaCafeArr: [HonzapdaCafe] = []
    
    private var locationManager: LocationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        locationManager.$region
            .receive(on: DispatchQueue.main)
            .assign(to: \.nowRegion, on: self)
            .store(in: &cancellables)
    }
    
    func updateRegion(lat: Double, lon: Double) {
        guard var currentRegion = nowRegion else {
            print("no nowRegion")
                  return
              }
        print("update Region func activate")
              currentRegion.center.latitude += lat
              currentRegion.center.longitude += lon
              nowRegion = currentRegion
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
    
    let sampleData: [HonzapdaCafe] = [
        HonzapdaCafe(id: 1,
                     placeName: "Cafe A",
                     adminName: "Owner A",
                     description: "Cozy cafe with a great ambiance",
                     otherDetails: "Free Wi-Fi, outdoor seating available",
                     shopPhoneNumber: "123-456-7890",
                     adminPhoneNumber: "987-654-3210",
                     address: "123 Main Street",
                     addressSpec: "Floor 1, Building A",
                     inactiveDate: "2023-12-31",
                     openNow: true,
                     photoUrl: "https://example.com/cafe_a_photo.jpg",
                     rating: 4.5,
                     reviewCount: 100,
                     posFromStation: "5 minutes walk",
                     densityOfDays: [20, 30, 25, 35, 40, 50, 45],
                     x: 37.1234,
                     y: 127.5678,
                     isSaved: false),
        HonzapdaCafe(id: 2,
                     placeName: "Cafe B",
                     adminName: "Owner B",
                     description: "Charming cafe with delicious coffee",
                     otherDetails: "Live music on weekends",
                     shopPhoneNumber: "234-567-8901",
                     adminPhoneNumber: "876-543-2109",
                     address: "456 Elm Street",
                     addressSpec: "Suite 100",
                     inactiveDate: "2023-12-31",
                     openNow: false,
                     photoUrl: "https://example.com/cafe_b_photo.jpg",
                     rating: 4.2,
                     reviewCount: 80,
                     posFromStation: "10 minutes walk",
                     densityOfDays: [15, 25, 20, 30, 35, 40, 35],
                     x: 37.2345,
                     y: 127.6789,
                     isSaved: false),
        HonzapdaCafe(id: 3,
                     placeName: "Cafe C",
                     adminName: "Owner C",
                     description: "Modern cafe with artisanal pastries",
                     otherDetails: "Private event space available",
                     shopPhoneNumber: "345-678-9012",
                     adminPhoneNumber: "765-432-1098",
                     address: "789 Oak Street",
                     addressSpec: "Floor 2",
                     inactiveDate: "2023-12-31",
                     openNow: true,
                     photoUrl: "https://example.com/cafe_c_photo.jpg",
                     rating: 4.7,
                     reviewCount: 120,
                     posFromStation: "3 minutes walk",
                     densityOfDays: [25, 35, 30, 40, 45, 55, 50],
                     x: 37.3456,
                     y: 127.7890,
                     isSaved: true),
        HonzapdaCafe(id: 4,
                     placeName: "Cafe D",
                     adminName: "Owner D",
                     description: "Quaint cafe with a vintage vibe",
                     otherDetails: "Dog-friendly patio area",
                     shopPhoneNumber: "456-789-0123",
                     adminPhoneNumber: "654-321-0987",
                     address: "901 Pine Street",
                     addressSpec: "Suite 200",
                     inactiveDate: "2023-12-31",
                     openNow: true,
                     photoUrl: "https://example.com/cafe_d_photo.jpg",
                     rating: 4.0,
                     reviewCount: 70,
                     posFromStation: "7 minutes walk",
                     densityOfDays: [10, 20, 15, 25, 30, 35, 30],
                     x: 37.4567,
                     y: 127.8901,
                     isSaved: true),
        HonzapdaCafe(id: 5,
                     placeName: "Cafe E",
                     adminName: "Owner E",
                     description: "Hip cafe with specialty coffee",
                     otherDetails: "Art gallery attached",
                     shopPhoneNumber: "567-890-1234",
                     adminPhoneNumber: "543-210-9876",
                     address: "234 Cedar Street",
                     addressSpec: "Floor 3",
                     inactiveDate: "2023-12-31",
                     openNow: false,
                     photoUrl: "https://example.com/cafe_e_photo.jpg",
                     rating: 4.3,
                     reviewCount: 90,
                     posFromStation: "12 minutes walk",
                     densityOfDays: [18, 28, 23, 33, 38, 43, 38],
                     x: 37.5678,
                     y: 127.9012,
                     isSaved: true)
    ]

    
}
