//
//  CarouselPageModel.swift
//  Honzapda
//
//  Created by YOUJIM on 3/6/24.
//

import Foundation

// MARK: 화면 구분을 위한 id, name, title, subtitle이 들어간 구조체 선언

struct CarouselPageModel: Hashable, Identifiable {
    var id: UUID = .init()
    var name: String
    var title: String
    var subTitle: String
}
