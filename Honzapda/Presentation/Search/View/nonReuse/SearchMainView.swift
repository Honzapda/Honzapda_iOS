//
//  File.swift
//  Honzapda
//
//  Created by 이재용 on 5/7/24.
//

// SearchMainView 완료
// 로고, 타이틀, 검색창, 최근 검색어 ui 구현
// 검색창 선택시 SearchView로 전환하도록 함
// SearchView에서 검색할 때마다 이를 searchViewModel의 recentSearched 배열에 기록 후 이를 받아온다 (pulbished 이용)
import SwiftUI


struct SearchMainView: View {
    var body: some View {
        VStack {
            headerView()
            Text("search")
        }
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        HStack {
            Image("logo_navigationbar")
        }
    }
}

struct SearchMainView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMainView()
    }
}
