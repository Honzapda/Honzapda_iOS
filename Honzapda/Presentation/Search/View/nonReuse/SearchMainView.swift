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
    @ObservedObject var searchViewModel: SearchViewModel
    @State var searchWord: String = "" // 검색어 컨트롤
    @State var editNow: Bool = false // 편집 기능 컨트롤
    let title: String = "검색어를\n입력해주세요"
    let placeholderText: String = "카페명, 주소명으로 검색"
    
    var body: some View {
        GeometryReader {geometry in
            ZStack(alignment: .top) {
                Image("background_searchmain")
                    .resizable()
                    .scaledToFill()
                
                VStack { // 헤더 뷰
                    headerView()
                    Spacer()
                }.frame(height: 45)
                
                VStack(alignment: .leading) { // 타이틀, 검색창
                    Text(title)
                        .font(Font.custom("S-Core Dream", size: 26))
                        .foregroundColor(.primary06)
                        .padding(.leading, 24)
                        .padding(.bottom, 30)
                    
                    searchWindow()
                        .padding(.bottom, 30)
                    
                    HStack { // 최근 검색어 타이틀, 편집기능
                        Text("최근 검색어")
                            .font(Font.custom("S-CoreDream-6Bold", size: 18))
                            .foregroundStyle(.primary06)
                            .padding(.leading, 24)
                        
                        Button {
                            editNow.toggle()
                        } label: {
                            if editNow {
                                Text("완료")
                                    .font(.sCoreDream(.medium, size: 10))
                                    .padding()
                            }
                            else {
                                Text("편집")
                                    .font(.sCoreDream(.medium, size: 10))
                                    .padding()
                            }
                        }
                    }
                    
                    // 뷰모델의 최근 검색어 배열을 이용해 생성
                    ForEach(searchViewModel.recentSearchWord.indices, id: \.self) { idx in
                        recentlySerached(edit: editNow, name: searchViewModel.recentSearchWord[idx])
                                        .padding(.leading, 24)
                                }
                    
                }
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, 160)
                
                
            }
        }
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        HStack { // 헤더 : 로고
            Image("logo_navigationbar")
                .padding(.leading, 20)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: 45)
    }
    
    @ViewBuilder
    private func searchWindow() -> some View { // 검색창
        TextField(placeholderText, text: $searchWord)
            .padding(20)  // 텍스트 필드 내부에 패딩 추가
            .background(
                RoundedRectangle(cornerRadius: 20)  // 둥근 사각형 배경
                    .strokeBorder(.primary06, lineWidth: 1)  // 테두리 색상 및 두께 지정
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))  // 테두리 내부를 흰색으로 채움
            )
            .overlay(
                Image("icon_search_search_fill")  // 시스템 아이콘 사용
                    .padding(.trailing, 20) // 오른쪽 내부에 패딩 추가
                , alignment: .trailing  // 오른쪽 정렬
            )
            .padding()  // 외부 패딩으로 뷰 주변 간격 추가
    }
    
    @ViewBuilder
    private func recentlySerached(edit: Bool, name: String) -> some View { // 최근 검색어 빌더
        HStack {
            if edit {
                Button(action: {
                    // "X" 버튼 동작을 여기에 정의합니다.
                    print("Delete tapped! \(name)")
                    if let index = searchViewModel.recentSearchWord.firstIndex(of: name) {
                        searchViewModel.recentSearchWord.remove(at: index)
                    }
                }) {
                    Image("icon_search_xbutton_fill")
                }
                .padding(.leading, 8) // 버튼에 패딩 추가
            } else {
                Spacer()
                    .frame(width: 0)
                    .padding(.leading, 16)
            }
            Text(name)
                .multilineTextAlignment(.center)
                .font(.sCoreDream(.medium, size: 14))
                .foregroundColor(.primary05)
                .padding(.vertical, 8)
                .padding(.trailing)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.primary05, lineWidth: 1)
                .background(.white)
            )
    }
}


struct SearchMainView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMainView(searchViewModel: SearchViewModel())
    }
}
