//
//  DetailPageMain.swift
//  Honzapda
//
//  Created by 송영훈 on 3/2/24.
//

import SwiftUI

// MARK: - MAIN VIEW
struct DetailPageMain: View {
    // MARK: PARAMETER
    var cafeName: String?
    // MARK: BODY
    var body: some View {
        ScrollView {
            CafeBannerView()
            CafeInfomationView()
            DividerBox()

            CafeCongestion()
            DividerBox()

            UserHelpfulInformation()
            DividerBox()

            UsersReview()
        } //: ScrollView
    }
}
// MARK: - 메인 배너
struct CafeBannerView: View {
    // MARK: PARAMETER
    var cafeBannerImageURL: String?
    var cafeLocation: String?
    var callNumber: String?
    var isOpening: Bool?
    // MARK: BODY
    var body: some View {
        ZStack {
            Image("Cafe/thumbnail_cafe_detail")
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text("스테이 어도러블")
                        .font(Font.custom("S-Core Dream", size: 22))
                    Text("영업 중")
                        .font(Font.custom("S-Core Dream", size: 6))
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.25)
                                .stroke(lineWidth: 0.5)
                        )
                    Spacer()
                }
                .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("경기 용인시 기흥구 죽전로43번길 15-3 1층")
                            .font(Font.custom("S-Core Dream", size: 10))
                            .foregroundColor(.gray01)
                        
                        HStack {
                            Image("Cafe/icon_home_phoneNumber_fill")
                                .foregroundColor(.white)
                            Text("010-9999-9999")
                                .font(Font.custom("S-Core Dream", size: 10))
                                .foregroundColor(.gray01)
                        }
                    }
                    Spacer()
                    VStack(spacing: 8) {
                        Image("Cafe/icon_my_heart_none")
                        Text("가게\n찜하기")
                            .font(Font.custom("S-Core Dream", size: 8))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
        }
    }
} //: 메인 배너
// MARK: - 카페 종합 정보
struct CafeInfomationView: View {
    // MARK: PARAMETER
    var distanceSummary: String?
    var rating: Float?
    var reviewCount: Int?
    var cafeIntroduce: String?
    // MARK: BODY
    var body: some View {
        VStack {
            VStack {
                Text("카페 정보")
                HStack {
                    VStack {
                        Image(systemName: "pin")
                        Text("죽전역부터\n걸어서 8분")
                    }
                    VStack {
                        Image(systemName: "star")
                        Text("평점\n4.83")
                    }
                    VStack {
                        Image(systemName: "note")
                        Text("리뷰\n363개")
                    }
                }
            }   //: 카페 정보
            VStack {
                Text("카페 소개")
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 329, height: 71)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.95))
                    Text("인테리어가 귀엽고 강아지가 감성적이예요 🥹")    // TODO: cafeIntroduce 파라미터로 내용 변경
                }
            }   //: 카페 소개
        }
    }
} //: 카페 종합 정보
// MARK: - 카페 혼잡도
struct CafeCongestion: View {
    // MARK: PARAMETER
    var weakdayStartTime: Float?
    var weakdayEndTime: Float?
    var weakendStartTime: Float?
    var weakendEndTime: Float?
    var seatTotal: Int?
    var seatCountedCamera: Int?
    var seatCountedNetwork: Int?
    // MARK: BODY
    var body: some View {
        VStack {
            VStack {
                Text("요일별 혼잡도")
                Text("요일별 혼잡도는 혼잡도 데이터를 모아 생성된 예상 혼잡도로서, 실제 척도와는 다를 수 있으니 유의하세요!")
                HStack {    // TODO: 혼잡도 이미지 표현 방식에 대한 부분 고려 필요
                    DayCongestionBox(today: "월")
                    DayCongestionBox(today: "화")
                    DayCongestionBox(today: "수")
                    DayCongestionBox(today: "목")
                    DayCongestionBox(today: "금")
                    DayCongestionBox(today: "토")
                    DayCongestionBox(today: "일")
                }
            } //: 요일별 혼잡도
            VStack {
                Text("평균 혼잡도")
                Text("평일과 주말 각각 어느 시간대에 가장 카페가 혼잡한지 알 수 있어요. ")
                HStack {
                    ZStack {
                        InfoBox(width: 148, height: 115,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        VStack {
                            Text("평일")
                            Text("18시 부터\n20시 까지")
                        }
                    }   //: 평일
                    ZStack {
                        InfoBox(width: 148, height: 115,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        VStack {
                            Text("주말")
                            Text("14시 부터\n16시 까지")
                        }
                    }   //: 주말
                }
            } //: 평균 혼잡도
            VStack {
                Text("실시간 혼잡도")
                Text("매장 카메라와 통신망을 이용해 분석한 실시간 혼잡도를 확인하세요.")
                ZStack {
                    InfoBox(width: 312, height: 100,
                                 shadow_color: .black.opacity(0.15),
                                 shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                    HStack {
                        Text("스테이 어도러블의\n전체 좌석 수")
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 1, height: 80)
                            .background(Color(red: 0.87, green: 0.87, blue: 0.87))
                        Text("23개")
                    }   //: 전체 좌석 수
                }
                HStack {
                    ZStack {
                        InfoBox(width: 151, height: 130,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        VStack {
                            Text("카메라 기준\n현재 차있는 좌석")
                            Text("4개")
                        }
                    } //: 카메라 기준 좌석 수
                    ZStack {
                        InfoBox(width: 152, height: 130,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        VStack {
                            Text("통신망 기준\n현재 차있는 좌석")
                            Text("6개")
                        }
                    } //: 통신망 기준 좌석 수
                }
            } //: 실시간 혼잡도
        }
    }
} //: 카페 혼잡도
// MARK: - 유저의 도움 정보
struct UserHelpfulInformation: View {
    // MARK: PARAMETER
    // MARK: BODY
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text("유저의 도움 정보")
                        Button("정보 제공하기") {
                            // TODO: 정보 제공 기능 구현
                            print("DUBUG: 정보 제공하기")
                        }
                    }
                    Text("유저들이 도와 제공한 카페 정보를 살펴보세요.\n유저들이 선택한 정보 순으로 제공해드릴게요 :)")
                }
                Button("정보 더 보기") {
                    // TODO: 정보 더 보기 기능 구현
                    print("DUBUG: 정보 더 보기")
                }
            }
            UsersHelpfulInformationBox()
        }
    }
} //: 유저의 도움 정보
// MARK: - 유저 리뷰
struct UsersReview: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text("리뷰")
                        Button("리뷰 작성하기") {
                            // TODO: 리뷰 작성하기 기능 구현
                            print("DEBUG: 리뷰 작성하기")
                        }
                    }
                    Text("유저들이 제공한 리뷰를 살펴보세요.\n유저들이 선택한 정보 순으로 제공해드릴게요 :)")
                }
                Button("리뷰 더 보기") {
                    // TODO: 리뷰 더 보기 기능 구현
                    print("DEBUG: 리뷰 더 보기")
                }
            }
            UsersReviewBox()
        }
    }
}   //: 유저 리뷰
// MARK: - 재사용하는 View
// MARK: - 요일별 혼잡도 이미지 박스
struct DayCongestionBox: View {
    var today: String!
    var body: some View {
        ZStack {
            InfoBox(width: 42, height: 60.66667,
                         shadow_color: .black.opacity(0.25), shadow_radius: 4,
                         shadow_x: 0, shadow_y: 4)
            VStack {
                Text(today)
                Image(systemName: "bolt")
            }
        }
    }
} //: 요일별 혼잡도 이미지 박스
// MARK: - 카페 정보 박스 템플릿
struct InfoBox: View {
    var width: CGFloat!
    var height: CGFloat!
    var shadow_color: Color!
    var shadow_radius: CGFloat!
    var shadow_x: CGFloat!
    var shadow_y: CGFloat!

    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: width, height: height)
            .background(.white)
            .cornerRadius(8)
            .shadow(color: shadow_color,
                    radius: shadow_radius,
                    x: shadow_x, y: shadow_y)
    }
} //: 카페 정보 박스 템플릿
// MARK: - 유저 도움 정보 박스
struct UsersHelpfulInformationBox: View {
    // MARK: PARAMETER
    var userProfileImageURL: String?
    var userName: String?
    var userVisitDay: String?
    var userVisitTime: Int?
    var recommendCount: Int?
    var congestion: String? // TODO: API상에서 String인데, 나중에 혼잡도 계산을 위해 Int형이 낫지 않을까? 싶은 의견 제시
    var deskSize: String?
    var outletCount: String?
    var light: String?
    var outletLocation: String?
    var restroomLocation: String?
    var musicGenre: String?
    var atmosphere: String?
    // MARK: BODY
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 345, height: 297)
                .background(Color(red: 0.96, green: 0.96, blue: 0.95))
                .cornerRadius(12)
            VStack {
                HStack {
                    Image(systemName: "bolt")   // TODO: userProfile param
                    VStack {
                        Text("체리")  // TODO: userName
                        Text("이 카페를 목요일 17시에 방문했어요")    // TODO: userVisitDay & Time
                    }
                    VStack {
                        Image(systemName: "heart")
                        Text("추천 123개")
                    }
                } //: 유저 정보
                VStack {
                    HStack {
                        Text("혼잡도는")
                        UsersHelpfulInformationUnderbar(info: "90%")
                        Text("정도인 것 같아요")
                    }
                    HStack {
                        UsersHelpfulInformationUnderbar(info: "넓은")
                        Text("책상을 보유하고 있어요")
                    }
                    HStack {
                        UsersHelpfulInformationUnderbar(info: "넉넉한")
                        Text("콘센트를 보유하고 있고 주로")
                        UsersHelpfulInformationUnderbar(info: "책상 밑")
                        Text("에 있어요")
                    }
                    HStack {
                        Text("화장실은")
                        UsersHelpfulInformationUnderbar(info: "1층 계단 옆")
                        Text("에 있어요")
                    }
                    HStack {
                        Text("노래는")
                        UsersHelpfulInformationUnderbar(info: "잔잔한")
                        Text("음악이 많이 나와요")
                    }
                    HStack {
                        Text("조명은")
                        UsersHelpfulInformationUnderbar(info: "밝은")
                        Text("편이예요")
                    }
                    HStack {
                        Text("전체적인 분위기는")
                        UsersHelpfulInformationUnderbar(info: "아늑한")
                        Text("것 같아요")
                    }
                } //: 유저 제공 정보
            }
        }
    }
} //: 유저 도움 정보 박스
// MARK: 유저 도움 정보 빈칸 언더바
struct UsersHelpfulInformationUnderbar: View {
    // MARK: PARAMETER
    var info: String!
    var width: Int?
    // MARK: BODY
    var body: some View {
        VStack {
            Text(info)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 38, height: 1)
                .background(Color(red: 0.87, green: 0.87, blue: 0.87))
        }
    }
} //: 유저 도움 정보 빈칸 언더바
// MARK: - 유저 리뷰 박스
struct UsersReviewBox: View {
    // MARK: PARAMETER
    var userProfileImageURL: String?
    var userName: String?
    var reviewScore: Double?
    var reviewRecommendCount: Int?
    var userReview: String?
    var userVisitDate: String?
    // MARK: BODY
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 345, height: 174)
                .background(Color(red: 0.96, green: 0.96, blue: 0.95))
                .cornerRadius(12)
            VStack {
                HStack {
                    Image(systemName: "bolt")
                    VStack {
                        Text("맥구")
                        Text("별점 5점")
                    }
                    VStack {
                        Image(systemName: "heart")
                        Text("추천 123개")
                    }
                } //: 유저
                Text("처음 가봤는데 사장님이 친절하시고 강아지가 귀엽고 인테리어가 예뻐요! 조용해서 친구랑 가서 이야기하기 좋습니다. 근데 가서 공부하기에는 테이블도 협소하고 분위기도 그런 분위기는 아닌 것 같아요. 담소 나누기 좋은 카페 ^_^")
                HStack {
                    Text("2024.02.17 방문")
                    Text("리뷰 신고하기")
                }
            } //: 유저 & 리뷰 내용
        }
    }
} //: 유저 리뷰 박스
// MARK: - 뷰 사이 공간
struct DividerBox: View {
  var body: some View {
      Rectangle()
          .foregroundColor(.clear)
          .background(Color(red: 0.96, green: 0.96, blue: 0.95))
  }
}   //: 뷰 사이 공간
//MARK: - 프리뷰
#Preview {
    DetailPageMain()
}
