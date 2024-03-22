//
//  HonzapdaCafeModel.swift
//  Honzapda
//
//  Created by 이재용 on 3/2/24.
//

import Foundation

struct HonzapdaCafe: Codable, Identifiable, Hashable {
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
    let photoUrl: String
    let rating: Double
    let reviewCount: Int
    let posFromStation: String
    let densityOfDays: [Int]
    let x: Double
    let y: Double
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
                 y: 127.5678),
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
                 y: 127.6789),
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
                 y: 127.7890),
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
                 y: 127.8901),
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
                 y: 127.9012)
]
