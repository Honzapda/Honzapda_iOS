import Foundation
import CoreLocation
import Combine
import MapKit

class LocationManager: NSObject, ObservableObject {
    // 로케이션 매니저 객체 생성: CLLocationManager의 인스턴스 생성
    private let locationManager = CLLocationManager()
    // 맵킷에 위치를 지정하는 리전 생성 -> 유일해야함: 지도에서 표시할 지역을 정의
    @Published var region: MKCoordinateRegion?

    override init() {
        super.init()
        // CLLocationManager의 델리게이트 설정
        locationManager.delegate = self
        // 위치 정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 앱 사용 중 위치 서비스 권한 요청
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트 시작
        locationManager.startUpdatingLocation()
    }
    // 현재 위치 요청 함수: 내 위치 버튼을 눌렀을 때 실행
    func requestCurrentLocation() {
            // 현재 위치를 한 번만 요청
            locationManager.requestLocation()
        }

}

// CLLocationManagerDelegate 프로토콜 구현
extension LocationManager: CLLocationManagerDelegate {
    // 위치가 업데이트 될 때 호출되는 메소드
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        // 가장 최근의 위치 정보를 가져옴
        guard let location = locations.last else { return }
        // 새로운 지역을 생성하여 지도의 중심을 현재 위치로 설정
        let newRegion = MKCoordinateRegion(center: location.coordinate,
                                           span: MKCoordinateSpan(latitudeDelta: 0.005,
                                                                  longitudeDelta: 0.005))
        // 메인 스레드에서 지역 정보를 업데이트 (UI 관련 변경이므로 메인 스레드 필요)
        DispatchQueue.main.async {
            self.region = newRegion
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print("Failed to find user's location: \(error.localizedDescription)")
       }
}
