//
//  SearchViewModel.swift
//  Honzapda
//
//  Created by 이재용 on 5/7/24.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchWord: String = ""
    @Published var recentSearchWord: [String] = ["스템커피", "스타벅스 강남점", "메가커피", "맘모스커피", "빽다방", "카페 쉬는시간", "집을 가"]
    
}
