//  CurationEntity.swift
//  Honzapda
//
//  Created by YOUJIM on 2/28/24.
//

import SwiftUI

// 큐레이션 뷰
struct CurationMainView: View {
    // gotoTest -> 테스트 뷰로 이동여부
 //   @State var gotoTest: Bool = false
    @ObservedObject var curationViewModel: CurationViewModel
    var body: some View {
        ZStack {
            NavigationView { // 화면 전체가 테스트 뷰로 이동함
                VStack {
                    NavigationLink(destination: CurationTestMainView(curationViewModel: curationViewModel),
                                   isActive: $curationViewModel.gotoTest) {
                        EmptyView()
                        // 추후 데이터 전달을 위해서 기본값 제공
                    }
                    HStack { // 헤더 부분, 로고와 앱 네임 -> 이미지 대체
                        Image("image_header_curationmain")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 1)
                        .foregroundColor(Color("Gray03"))
                    
                    ScrollView {
                        ZStack {
                            Image("background_curation")
                            VStack {
                                // cubv1
                                CurationBodyView( curationViewModel: curationViewModel,
                                                  dataset: curationViewModel.cuData,
                                                  blur: false)
                                    .padding(.vertical, 48)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: UIScreen.main.bounds.width, height: 20)
                                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                // cubv2
                                CurationBodyView(curationViewModel: curationViewModel,
                                                 dataset: curationViewModel.cuData2,
                                                 blur: true)
                                    .padding(.vertical, 48)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: UIScreen.main.bounds.width, height: 20)
                                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                // cubv3
                                CurationBodyView(curationViewModel: curationViewModel,
                                                 dataset: curationViewModel.cuData3,
                                                 blur: false)
                                    .padding(.vertical, 48)
                                Spacer()
                            }
                        }
                    } // 캐러셀이 적용된 카드뷰들
                }
            }
            if curationViewModel.testPopup {
                TestStartPopUp(curationViewModel: curationViewModel)
            } // 테스트 팝업
            
            if curationViewModel.gotoResult {
                CurationResultView(curationViewModel: curationViewModel)
            }// 큐레이션 결과창 이동
        }
    }
}

struct CurationBodyView: View {
    @ObservedObject var curationViewModel: CurationViewModel
    var dataset: CurationBVdataset // 데이터셋 구조체
    let blur: Bool
//    @Binding var gotoTest: Bool
    var body: some View {
        VStack(spacing: 16) {
            // Title and Subtitle View
            VStack {
                HStack {
                    Text(dataset.title)
                        .font(Font.custom("S-CoreDream-6Bold", size: 26))
                        .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                        .lineSpacing(10)
                    Spacer()
                }
                .padding(.bottom)

                HStack {
                    Text(dataset.subtitle)
                        .font(Font.custom("S-Core Dream", size: 10))
                        .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                        .lineSpacing(5)
                    Spacer()
                }
                .padding(.bottom, 24)
            }
            .padding(.leading, 24)
            if blur {
                Carousel(pageCount: dataset.cafeImgArr.count, visibleEdgeSpace: 30,
                         spacing: 30) { index in
                    CurationCardView(
                        imageString: dataset.cafeImgArr[index],
                        cafeTitle: dataset.cafeTitleArr?[index],
                        cafeNumber: dataset.cafeNumberArr?[index]
                    )
                    .shadow(radius: 5)
                    .frame(width: 265, height: 367)
                    .cornerRadius(15)
                }
                .frame(height: 370) // Carousel의 전체 높이 설정
                .blur(radius: 3)
                .overlay(
                    VStack {
                        Text("간단한 테스트로\n나와 어울리는 카페를 추천받으세요!")
                            .font(Font.custom("S-Core Dream", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(10)
                        Button {
                            curationViewModel.testPopup = true
                            print("gotoTest -> \(curationViewModel.testPopup)")
                        } label: {
                            Text("테스트하러 가기")
                                .padding(.vertical, 10) // 상하 패딩 적용
                                .padding(.horizontal, 15) // 좌우 패딩 적용
                                .font(.custom("S-Core Dream", size: 10))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .background(Color.clear) // 먼저 Text의 배경색을 설정
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                            // Text의 배경에 둥근 모서리 적용
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                    // Overlay로 RoundedRectangle 추가
                                        .stroke(.white, lineWidth: 1) // 테두리 색상과 두께 설정
                                )                        }

                    }
                )
            } else {
                Carousel(pageCount: dataset.cafeImgArr.count,
                         visibleEdgeSpace: 30,
                         spacing: 30) { index in
                    CurationCardView(
                        imageString: dataset.cafeImgArr[index],
                        cafeTitle: dataset.cafeTitleArr?[index],
                        cafeNumber: dataset.cafeNumberArr?[index]
                    )
                    .shadow(radius: 5)
                    .frame(width: 265, height: 367)
                    .cornerRadius(15)
                }
                .frame(height: 370) // Carousel의 전체 높이 설정
            }
            // Carousel View

        }
    }
}
struct CurationCardView: View {
    let imageString: String
    let cafeTitle: String?
    let cafeNumber: Int?
    var body: some View {
        ZStack(alignment: .top) {
            Image(imageString)
                .resizable()
                .scaledToFill()
                .clipped()
                .overlay(Color.black.opacity(0.3))
            VStack(alignment: .leading) {
                if let title = cafeTitle {
                    // Optional binding을 사용하여 cafeTitle이 nil이 아닌 경우에만 Text 뷰를 생성
                                    Text(title)
                                        .font(Font.custom("S-CoreDream-6Bold", size: 20))
                                        .foregroundColor(.white)
                                        .lineSpacing(8.0)
                                }
                if let number = cafeNumber {
                    // Optional binding을 사용하여 cafeNumber이 nil이 아닌 경우에만 Text 뷰를 생성
                    Text("\(number)곳")
                        .font(Font.custom("S-Core Dream", size: 12))
                        .foregroundColor(.white)
                        .padding(.top, 5)
                }
            }.frame(width: 235, alignment: .leading)
                .padding()
        }
        .frame(width: 265, height: 367)
        .cornerRadius(15)
    }
}

struct CurationBVdataset {
    let title: String
    let subtitle: String
    let cafeImgArr: [String] // 이것과 텍스트 배열은 일치시켜야함
    let cafeTitleArr: [String]?
    let cafeNumberArr: [Int]?
}
struct CUPV2: PreviewProvider {
    static var previews: some View {
        // CurationBodyView(dataset: cuData)
        CurationMainView(curationViewModel: CurationViewModel())
    }
}
