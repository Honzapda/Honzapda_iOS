//
//  HomeSavedCafe.swift
//  Honzapda
//
//  Created by 이재용 on 3/2/24.
//

// 바텀시트
import Foundation
import SwiftUI

struct HomeBottomSheetView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    let columns = [  // 그리드 뷰에서 사용할 열 구성을 정의합니다.
        GridItem(.flexible()),  // 각 열이 유연하게 크기 조정되도록 설정합니다.
        GridItem(.flexible())
    ]
    var cafes: [HonzapdaCafe] = HomeViewModel.sampleData
    var body: some View {
        ZStack(alignment: .top) {
            Image("MySavedCafeBottomSheetAsset")
                .resizable() // 이미지 크기 조정 가능하도록 설정
                .scaledToFill() // 이미지를 프레임에 꽉 차게 채움
                .clipped() // 프레임을 넘어서는 부분을 잘라냄
            
            VStack { // 드래그 바, 제목, 스크롤뷰
                HStack { // 드래그 바, 외부에서 해당 뷰를 슬라이드업다운 하면 화면의 크기가 조정됨, 그러나 이는 눈속임이고 실제로는 뷰 자체에서 크기 조절함
                    Rectangle()
                        .foregroundColor(.gray04)
                        .frame(width: 100, height: 3)
                        .padding(.top, 10)
                }
                
                HStack { // 제목
                    Text("내가 저장한 카페")
                        .font(.sCoreDream(.medium, size: 20))
                        .foregroundColor(.primary06)
                    
                    Spacer()
                }.padding(.leading, 24)
                    .padding(.vertical)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(cafes) { cafe in
                            ZStack(alignment: .bottomLeading) {
                                AsyncImage(url: URL(string: cafe.photoUrl)) { image in
                                    switch image {
                                    case .empty:
                                        ProgressView() // 이미지가 로드되기 전에 프로그레스 뷰를 표시
                                            .frame(width: 165, height: 160) // 프레임 크기 설정
                                            .cornerRadius(10) // 모서리 둥글게 처리
                                            .clipped()
                                    case .success(let image):
                                        image.resizable() // 로드된 이미지에 resizable() 적용
                                            .aspectRatio(contentMode: .fit) // 콘텐츠 모드 설정
                                            .frame(width: 165, height: 160) // 프레임 크기 설정
                                            .cornerRadius(10) // 모서리 둥글게 처리
                                            .clipped()
                                    case .failure:
                                        Image("image_curationmain_cafesample1") // 로드 실패 시 기본 이미지 표시
                                            .aspectRatio(contentMode: .fit) // 콘텐츠 모드 설정
                                            .frame(width: 165, height: 160) // 프레임 크기 설정
                                            .cornerRadius(10) // 모서리 둥글게 처리
                                            .clipped()
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView() // 예상치 못한 상황에 대비한 빈 뷰 처리
                                    }
                                }
                                VStack(alignment: .leading) {
                                    Text(cafe.placeName)
                                        .font(Font.custom("S-CoreDream-6Bold", size: 14))
                                        .foregroundColor(.white)
                                    
                                    Text(cafe.address + cafe.addressSpec)
                                        .font(Font.custom("S-Core Dream", size: 8))
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom, 16) // 아래쪽으로부터 16포인트
                                .padding(.leading, 16) // 왼쪽으로부터 16포인트
                                .frame(width: 165, alignment: .leading) // 폭을 설정하고 좌측 정렬
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height - 47,
               alignment: .bottom)
    }
}

struct Bottomsheet_Previews: PreviewProvider {
    static var previews: some View {
        HomeBottomSheetView(homeViewModel: HomeViewModel())
    }
}
