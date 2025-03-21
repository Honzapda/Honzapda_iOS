//
//  HonzapdaCafeModel.swift
//  Honzapda
//
//  Created by 이재용 on 3/2/24.
//

import Foundation

struct HonzapdaCafe: Codable, Identifiable, Hashable { // 서버 리시버
    let id: Int
    let placeName: String
    let adminName: String
    let description: String
    let otherDetails: String
    let shopPhoneNumber: String
    let adminPhoneNumber: String
    let address: String
    let addressSpec: String
    let inactiveDate: String
    let openNow: Bool
    var photoUrl: String
    let rating: Double
    let reviewCount: Int
    let posFromStation: String
    let densityOfDays: [Int]
    let x: Double
    let y: Double
    var isSaved: Bool = false  // 앱 내부에서 사용하는 프로퍼티
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    enum CodingKeys: String, CodingKey {
        case id
        case placeName = "place_name"
        case adminName
        case description
        case otherDetails = "otherDetails"
        case shopPhoneNumber = "phone"
        case adminPhoneNumber
        case address
        case addressSpec = "address_spec"
        case inactiveDate
        case openNow
        case photoUrl
        case rating
        case reviewCount
        case x
        case y
        case posFromStation
        case densityOfDays
    }
}
