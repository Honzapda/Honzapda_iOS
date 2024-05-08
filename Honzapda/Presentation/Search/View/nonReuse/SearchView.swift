//
//  SearchView.swift
//  Honzapda
//
//  Created by 이재용 on 5/7/24.
//

// SearchView 완료
// 크게 상단 검색뷰, 검색뷰 하단, 화면 양측, 탭뷰 윗 부분에 붙어있는 안내 문구(infoView)
import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @State var searchWord: String = "" // 검색어 컨트롤
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image("background_search")
                    .resizable()
                    .scaledToFill()
                    .border(Color.blue)
                    .frame(width: UIScreen.main.bounds.width)
                    .overlay(
                        Text("검색어를 입력해주세요 ")
                            .font(.sCoreDream(.medium, size: 14))
                            .foregroundStyle(.gray07)
                    )
                headerView()
            }
        }
        
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        HStack { // 헤더 : 로고
            Image("icon_chevron_left")
                .padding()
            
            TextField("카페명, 주소명으로 검색", text: $searchWord)
            
            Image("icon_search_search_fill")
                .padding()
        }
        .background(.white)
        .frame(width: UIScreen.main.bounds.width, height: 45)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchViewModel: SearchViewModel())
    }
}
