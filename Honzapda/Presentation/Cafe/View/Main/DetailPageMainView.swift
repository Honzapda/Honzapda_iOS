//
//  DetailPageMainView.swift
//  Honzapda
//
//  Created by 송영훈 on 3/2/24.
//

// MARK: - FRAMEWORK
import SwiftUI

// MARK: - MAIN VIEW
struct DetailPageMainView: View {
    // MARK: PARAMETER
    var cafeName: String?
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            ScrollView {
                CafeBannerView()
                CafeInfomationView()
                DividerBoxView()
                
                CafeCongestionView()
                DividerBoxView()
                
                UserHelpfulInformationView()
                DividerBoxView()
                
                UsersReviewView()
            } //: ScrollView
        }
    }
}

// MARK: - 메인 배너
struct CafeBannerView: View {
    // MARK: PARAMETER
    var cafeBannerImageURL: String?
    var cafeLocation: String?   // 도로명 주소
    var callNumber: String?
    var isOpening: Bool?
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Image("Cafe/thumbnail_cafe_detail")
            VStack(alignment: .leading) { // 메인 배너
                Spacer()
                
                HStack {
                    Text("스테이 어도러블")
                        .font(.sCoreDream(.bold, size: 24))
                    
                    Text("영업 중")
                        .font(.sCoreDream(.light, size: 8))
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
                            .font(.sCoreDream(.medium, size: 12))
                            .foregroundColor(.gray01)
                        
                        HStack {
                            Image("Cafe/icon_home_phoneNumber_fill")
                                .foregroundColor(.white)
                            
                            Text("010-9999-9999")
                                .font(.sCoreDream(.medium, size: 12))
                                .foregroundColor(.gray01)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 8) {
                        Image("Cafe/icon_my_heart_none")
                        
                        Text("가게\n찜하기")
                            .font(.sCoreDream(.medium, size: 10))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
            } //: 메인 배너
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
        }
    }
} //: 메인 배너

// MARK: - 카페 종합 정보
struct CafeInfomationView: View {
    // MARK: PARAMETER
    var distanceSummary: String?    // 주변 대표지역으로 부터 N분 소요
    var rating: Float?
    var reviewCount: Int?
    var cafeIntroduce: String?      // 카페 한줄 소개
    
    // MARK: BODY
    var body: some View {
        VStack {
            VStack { // 카페 정보
                HStack {
                    Text("카페 정보")
                        .font(.sCoreDream(.bold, size: 18))
                        .foregroundColor(.gray09)
                    
                    Spacer()
                }
                
                Spacer(minLength: 24)
                
                HStack(spacing: 80) {
                    VStack {
                        Image("Cafe/icon_home_location_fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Spacer(minLength: 11.87)
                        
                        Text("죽전역부터\n걸어서 8분")
                            .font(.sCoreDream(.medium, size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary06)
                    }
                    
                    VStack {
                        Image("Cafe/icon_home_star_fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Spacer(minLength: 13.1)
                        
                        Text("평점\n4.83")
                            .font(.sCoreDream(.medium, size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary06)
                    }
                    VStack {
                        Image("Cafe/icon_home_review_fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Spacer(minLength: 13)
                        
                        Text("리뷰\n363개")
                            .font(.sCoreDream(.medium, size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary06)
                    }
                }
                .frame(maxHeight: 80)
            } //: 카페 정보
            
            Spacer(minLength: 32)
            
            VStack { // 카페 소개
                HStack {
                    Text("카페 소개")
                        .font(.sCoreDream(.bold, size: 18))
                        .foregroundColor(.gray09)
                    
                    Spacer()
                }
                Spacer(minLength: 16)
                
                ZStack {
                    Rectangle()
                        .cornerRadius(8)
                        .frame(width: 329, height: 71)
                        .foregroundColor(.gray02)
                    
                    Text("인테리어가 귀엽고 강아지가 감성적이예요 🥹")
                        .font(.sCoreDream(.medium, size: 12))
                }
            } //: 카페 소개
        }
        .padding(EdgeInsets(top: 32, leading: 24, bottom: 32, trailing: 24))
    }
} //: 카페 종합 정보

// MARK: - 카페 혼잡도
struct CafeCongestionView: View {
    // MARK: PARAMETER
    var weakdayStartTime: Float?    // 평일 혼잡 시간(시작)
    var weakdayEndTime: Float?
    var weakendStartTime: Float?    // 주말 혼잡 시간(시작)
    var weakendEndTime: Float?
    var seatTotal: Int?
    var seatCountedCamera: Int?
    var seatCountedNetwork: Int?
    
    // MARK: BODY
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) { // 요일별 혼잡도
                HStack {
                    Text("요일별 혼잡도")
                        .font(.sCoreDream(.bold, size: 18))
                        .foregroundColor(.gray09)
                    
                    Image("Cafe/icon_home_info_none")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                    
                    Spacer()
                }
                Text("요일별 혼잡도는 혼잡도 데이터를 모아 생성된 예상 혼잡도로서, 실제 척도와는 다를 수 있으니 유의하세요!")
                    .font(.sCoreDream(.medium, size: 11))
                    .foregroundColor(.gray06)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 8) {
                    DayCongestionBoxView(today: "월", congestion: "COMFORTABLE")
                    DayCongestionBoxView(today: "화", congestion: "BUSY")
                    DayCongestionBoxView(today: "수", congestion: "COMFORTABLE")
                    DayCongestionBoxView(today: "목", congestion: "NORMAL")
                    DayCongestionBoxView(today: "금", congestion: "COMFORTABLE")
                    DayCongestionBoxView(today: "토", congestion: "BUSY", textColor: .primary04)
                    DayCongestionBoxView(today: "일", congestion: "BUSY", textColor: .second204)
                }
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 32.33, trailing: 8))
                .frame(maxWidth: .infinity)
            } //: 요일별 혼잡도
            
            VStack(alignment: .leading, spacing: 8) { // 평균 혼잡도
                HStack {
                    Text("평균 혼잡도")
                        .font(.sCoreDream(.bold, size: 18))
                        .foregroundColor(.gray09)
                    
                    Spacer()
                }
                Text("평일과 주말 각각 어느 시간대에 가장 카페가 혼잡한지 알 수 있어요.")
                    .font(.sCoreDream(.medium, size: 11))
                    .foregroundColor(.gray06)
                    .multilineTextAlignment(.leading)
                
                Spacer().frame(height: 8)
                
                HStack(spacing: 16) {
                    ZStack {
                        InfoBoxView(width: 148, height: 115,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        
                        VStack(spacing: 8) {
                            Text("평일")
                                .font(.sCoreDream(.bold, size: 16))
                                .foregroundColor(.gray08)
                            
                            Text("18시 ")
                                .font(.sCoreDream(.bold, size: 20))
                                .foregroundColor(.primary05)
                            + Text("부터")
                                .font(.sCoreDream(.light, size: 14))
                                .foregroundColor(.gray06)
                            
                            Text("20시 ")
                                .font(.sCoreDream(.bold, size: 20))
                                .foregroundColor(.primary05)
                            + Text("까지")
                                .font(.sCoreDream(.light, size: 14))
                                .foregroundColor(.gray06)
                        }
                    } //: 평일
                    ZStack {
                        InfoBoxView(width: 148, height: 115,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        
                        VStack(spacing: 8) {
                            Text("주말")
                                .font(.sCoreDream(.bold, size: 16))
                                .foregroundColor(.gray08)
                            
                            Text("14시 ")
                                .font(.sCoreDream(.bold, size: 20))
                                .foregroundColor(.primary05)
                            + Text("부터")
                                .font(.sCoreDream(.light, size: 14))
                                .foregroundColor(.gray06)
                            
                            Text("16시 ")
                                .font(.sCoreDream(.bold, size: 20))
                                .foregroundColor(.primary05)
                            + Text("까지")
                                .font(.sCoreDream(.light, size: 14))
                                .foregroundColor(.gray06)
                        }
                    } //: 주말
                }
                .frame(maxWidth: .infinity)
            } //: 평균 혼잡도
            
            Spacer().frame(height: 32)
            
            VStack(alignment: .leading, spacing: 8) { // 실시간 혼잡도
                HStack {
                    Text("실시간 혼잡도")
                        .font(.sCoreDream(.bold, size: 18))
                        .foregroundColor(.gray09)
                    
                    Spacer()
                }
                
                Text("매장 카메라와 통신망을 이용해 분석한 실시간 혼잡도를 확인하세요.")
                    .font(.sCoreDream(.medium, size: 11))
                    .foregroundColor(.gray06)
                    .multilineTextAlignment(.leading)
                
                Spacer().frame(height: 0)
                
                ZStack {
                    InfoBoxView(width: 312, height: 100,
                                 shadow_color: .black.opacity(0.15),
                                 shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                    
                    HStack(spacing: 32) {
                        VStack(alignment: .trailing, spacing: 4) {
                            Text("스테이 어도러블")
                                .font(.sCoreDream(.bold, size: 16))
                                .foregroundColor(.primary05)
                            + Text("의")
                                .font(.sCoreDream(.medium, size: 14))
                                .foregroundColor(.gray08)
                            
                            Text("전체 좌석 수")
                                .font(.sCoreDream(.medium, size: 14))
                                .foregroundColor(.gray08)
                        }
                        
                        Rectangle()
                            .foregroundColor(.gray03)
                            .frame(width: 1, height: 80)
                        
                        Text("23개")
                            .font(.sCoreDream(.bold, size: 24))
                    } //: 전체 좌석 수
                }
                .frame(maxWidth: .infinity)
                
                Spacer().frame(height: 0)
                
                HStack(spacing: 9) {
                    ZStack {
                        InfoBoxView(width: 151, height: 130,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        
                        VStack(alignment: .center, spacing: 4) {
                            Text("카메라 기준")
                                .font(.sCoreDream(.bold, size: 14))
                                .foregroundColor(.primary05)
                            
                            Text("현재 차있는 좌석")
                                .font(.sCoreDream(.medium, size: 12))
                                .foregroundColor(.gray08)
                            
                            Spacer().frame(height: 9)
                            
                            Text("4개")
                                .font(.sCoreDream(.bold, size: 20))
                        }
                    } //: 카메라 기준 좌석 수
                    ZStack {
                        InfoBoxView(width: 152, height: 130,
                                     shadow_color: .black.opacity(0.15),
                                     shadow_radius: 6, shadow_x: 0, shadow_y: 4)
                        
                        VStack(alignment: .center, spacing: 4) {
                            Text("통신망 기준")
                                .font(.sCoreDream(.bold, size: 14))
                                .foregroundColor(.primary05)
                            
                            Text("현재 차있는 좌석")
                                .font(.sCoreDream(.medium, size: 12))
                                .foregroundColor(.gray08)
                            
                            Spacer().frame(height: 9)
                            
                            Text("6개")
                                .font(.sCoreDream(.bold, size: 20))
                        }
                    } //: 통신망 기준 좌석 수
                }
                .frame(maxWidth: .infinity)
            } //: 실시간 혼잡도
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    } // : body
} //: 카페 혼잡도

// MARK: - 유저의 도움 정보
struct UserHelpfulInformationView: View {
    // MARK: PARAMETER
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 8) {
            HStack { // 유저의 도움 정보 헤더
                Spacer()
                    .frame(width: 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Text("유저의 도움 정보")
                            .font(.sCoreDream(.bold, size: 18))
                            .foregroundColor(.gray09)
                        
                        Button("정보 제공하기") {
                            print("DUBUG: 정보 제공하기")
                        }
                        .font(.sCoreDream(.medium, size: 11))
                        .foregroundColor(.primary05)
                        
                        Spacer()
                    }
                    
                    Text("유저들이 도와 제공한 카페 정보를 살펴보세요.\n유저들이 선택한 정보 순으로 제공해드릴게요 :)")
                        .font(.sCoreDream(.medium, size: 11))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray06)
                }
                
                Spacer()
                
                NavigationLink("정보 더 보기", destination: MoreHelpfulInformationView())
                    .font(.sCoreDream(.medium, size: 11))
                    .foregroundColor(.primary05)
            } //: 유저의 도움 정보 헤더
            
            Spacer().frame(height: 0)
            
            UsersHelpfulInformationBoxView()
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    }
} //: 유저의 도움 정보
// MARK: - 유저 리뷰
struct UsersReviewView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack { // 리뷰 헤더
                Spacer()
                    .frame(width: 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Text("리뷰")
                            .font(.sCoreDream(.bold, size: 18))
                            .foregroundColor(.gray09)
                        
                        Button("리뷰 작성하기") {
                            print("DEBUG: 리뷰 작성하기")
                        }
                        .font(.sCoreDream(.medium, size: 11))
                        .foregroundColor(.primary05)
                        
                        Spacer()
                    }
                    Text("유저들이 제공한 리뷰를 살펴보세요.\n유저들이 선택한 정보 순으로 제공해드릴게요 :)")
                        .font(.sCoreDream(.medium, size: 11))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray06)
                    
                    Spacer().frame(height: 0)
                }
                
                Spacer()
                
                NavigationLink("리뷰 더 보기", destination: MoreReviewView())
                    .font(.sCoreDream(.medium, size: 11))
                    .foregroundColor(.primary05)
            } //: 리뷰 헤더
            UsersReviewBoxView()
        }
        .padding(EdgeInsets(top: 40, leading: 24, bottom: 40, trailing: 24))
    }
} //: 유저 리뷰

// MARK: - 요일별 혼잡도 이미지 박스
struct DayCongestionBoxView: View {
    // MARK: - PARAMETER
    var today: String!  // 요일
    var congestion: String!
    var textColor: Color! = .gray08
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            InfoBoxView(width: 42, height: 60.66667,
                         shadow_color: .black.opacity(0.25), shadow_radius: 4,
                         shadow_x: 0, shadow_y: 4)
            
            VStack(spacing: 8) { // 혼잡도 이미지
                Text(today)
                    .font(.sCoreDream(.bold, size: 10))
                    .foregroundColor(textColor)
                
                if congestion == "COMFORTABLE" {
                    Image("Cafe/icon_home_crowd_low")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                } else if congestion == "NORMAL" {
                    Image("Cafe/icon_home_crowd_middle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                } else if congestion == "BUSY" {
                    Image("Cafe/icon_home_crowd_high")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                }
            } //: 혼잡도 이미지
        }
    }
} //: 요일별 혼잡도 이미지 박스

// MARK: - 프리뷰
#Preview {
    DetailPageMainView()
} //: 프리뷰
