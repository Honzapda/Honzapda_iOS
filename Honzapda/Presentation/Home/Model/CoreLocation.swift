//
//  CoreLocation.swift
//  Honzapda
//
//  Created by 이재용 on 2/29/24.
//
import Foundation

import CoreLocation
import Combine
import MapKit

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func requestCurrentLocation() { // 내 위치 버튼 실행시 작동
            locationManager.requestLocation() // 현재 위치를 한 번만 요청
        }

}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let newRegion = MKCoordinateRegion(center: location.coordinate,
                                           span: MKCoordinateSpan(latitudeDelta: 0.005,
                                                                  longitudeDelta: 0.005))
        DispatchQueue.main.async {
            self.region = newRegion
        }
    }
}
