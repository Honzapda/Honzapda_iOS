//
//  SearchView.swift
//  Honzapda
//
//  Created by 이재용 on 5/7/24.
//

// SearchView 완료
// 크게 상단 검색뷰, 검색뷰 하단, 화면 양측, 탭뷰 윗 부분에 붙어있는 안내 문구(infoView)
// SerachResultView 완료
// infoView만큼의 크기를 가지도록 설정
// curationResultView의 card view를 재활용 하여 이를 스크롤 뷰로 설정,
// 최상단에는 (검색결과 수) (필터 1) (필터 2) 형식으로 구성됨
// 소팅 기능은 추후 해야겠지만 필터에 해당하는 값은 해당 cardview에 포함되어야 함
// 열거형으로 필터의 경우를 정의함, Switch문을 이용해서 인자로 받아온 배열을 정렬함
import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @State var searchWord: String = "" // 검색어 컨트롤
    // 필터는 기본적으론 none 이고 선택된 필터는 state로 관리됨
    @State var selectedFilter: FilterOption = .none
    // 필터: 거리순, 리뷰순, 저장순, 추천순
    let filters: [FilterOption] = [.distances, .reviewCount, .saved, .recommended]
    
    
    var body: some View {
        GeometryReader { _ in
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
                VStack {
                    headerView()
                    
                    HStack(spacing: 10) {
                        Text("전체 4")
                            .filterStyle(selected: true)
                        
                        ForEach(filters, id: \.self) { filter in
                            filterGenerator(filter: filter, selection: selectedFilter)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    .background(.white)
                    
                    
                    resultViewGenerator(filter: selectedFilter, searchedCafes: [])
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        HStack { // 헤더 : 뒤로가기, 검색창, 돋보기 아이콘
            Button {
                print("dismiss")
                searchViewModel.convertSearchPage.toggle()
            } label: {
                Image("icon_chevron_left")
                    .padding()
            }
            
            TextField("카페명, 주소명으로 검색", text: $searchViewModel.searchWord)
                .onSubmit {
                    searchViewModel.recentSearchWord
                        .insert(searchViewModel.searchWord, at: 0)
                }
                .submitLabel(.done)
            
            Button {
                searchViewModel.recentSearchWord
                    .insert(searchViewModel.searchWord, at: 0)
            } label: {
                Image("icon_search_search_fill")
                    .padding()
            }
            
            
        }
        .background(.white)
        .frame(width: UIScreen.main.bounds.width, height: 45)
    }
    
    @ViewBuilder
    private func resultViewGenerator(filter: FilterOption, searchedCafes: [String]) -> some View {
        // 추후 변경점
        /*
         1. 인자로 배열을 받아옴
         2. 해당 배열의 길이만큼 큐레이션 셀 뷰 선언
         */
        ScrollView(showsIndicators: false) { // 결과 카페들 내역
            VStack {
                CurationResultCellView()
                    .padding(.top)
                CurationResultCellView()
                    .padding(.top)
                CurationResultCellView()
                    .padding(.top)
                CurationResultCellView()
                    .padding(.top)
                Spacer()
                    .frame(height: 100)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(.gray03)
    }
    
    @ViewBuilder
    private func filterGenerator(filter: FilterOption, selection: FilterOption) -> some View {
        switch filter {
        case .distances:
            Button {
                selectedFilter = .distances
            } label: {
                if filter == selection {
                    Text("거리순")
                        .filterStyle(selected: true)
                } else {
                    Text("거리순")
                        .filterStyle(selected: false)
                }
            }

            
        case .reviewCount:
            
            Button {
                selectedFilter = .reviewCount
            } label: {
                if filter == selection {
                    Text("리뷰순")
                        .filterStyle(selected: true)
                } else {
                    Text("리뷰순")
                        .filterStyle(selected: false)
                }
            }

            
        case .saved:
            Button {
                selectedFilter = .saved
            } label: {
                if filter == selection {
                    Text("저장순")
                        .filterStyle(selected: true)
                } else {
                    Text("저장순")
                        .filterStyle(selected: false)
                }
            }

            
        case .recommended:
            Button {
                selectedFilter = .recommended
            } label: {
                if filter == selection {
                    Text("추천순")
                        .filterStyle(selected: true)
                } else {
                    Text("추천순")
                        .filterStyle(selected: false)
                }
            }

        case .none:
            EmptyView()
        }
    }
}


enum FilterOption {
    case none, distances, reviewCount, saved, recommended
}

extension View {
    func filterStyle(selected: Bool) -> some View {
        self.modifier(FilterModifier(selection: selected))
    }
}

struct FilterModifier: ViewModifier {
    var selection: Bool
    
    func body(content: Content) -> some View {
        if selection {
            content
                .font(.sCoreDream(.medium, size: 12))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)  // 둥근 사각형 배경
                        .strokeBorder(.primary05, lineWidth: 1)  // 테두리 색상 및 두께 지정
                        .background(RoundedRectangle(cornerRadius: 12).fill(.primary05))) // 테두리 내부를 흰색으로 채움
                .foregroundColor(.white)
        } else {
            content
                .font(.sCoreDream(.medium, size: 12))
                .padding(.horizontal, 16)  // 좌우로 16포인트 패딩
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)  // 둥근 사각형 배경
                        .strokeBorder(.primary05, lineWidth: 1)  // 테두리 색상 및 두께 지정
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))) // 테두리 내부를 흰색으로 채움
                .foregroundColor(.primary05)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchViewModel: SearchViewModel())
    }
}
