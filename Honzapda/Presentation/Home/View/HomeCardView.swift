//
//  HomeCardView.swift
//  Honzapda
//
//  Created by 이재용 on 3/2/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State var savedChecker: Bool // 카드뷰가 표시하는 카페가 저장 되었는지 여부
    var dataset: HonzapdaCafe = sampleData[0] // 데이터셋: 추후 api를 통해 받아온 카페 데이터를 보유하도록 변경됨
    let shopID: Int // 현재 카페의 숍 아이디를 따로 저장
    @Binding var gotoDetailBool: Bool // 상세 뷰 이동 여부를 표시
//    @Binding var detailShopId: Int // 상세뷰에서 표시할 카페 아이디를 저장하지만 필요 없을 것으로 추정됨 -> 삭제 예정
    var body: some View {
        VStack {
            // MARK: 카드 뷰 상단 이미지 부분
            ZStack {
                AsyncImage(url: URL(string: dataset.photoUrl)) {
                    // 이미지가 성공적으로 로드되었을 때의 뷰
                    image in image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 8 / 10,
                               height: UIScreen.main.bounds.height * 0.23)
                        .clipped()
                        .overlay(Color.black.opacity(0.3))
                        .onTapGesture {
                            self.gotoDetailBool = true
                            self.detailShopId = shopID
                        }
                } placeholder: {
                    // 이미지 로드 중 또는 URL이 nil인 경우 표시할 뷰
                    Image("CafeSampleIMG")
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.8) // 최외곽 VStack의 너비에 맞춤
                        .clipped() // VStack의 경계를 넘어가는 부분을 잘라냄
                        .onTapGesture {
                            self.gotoDetailBool = true
                            self.detailShopId = shopID
                        }
                }
                .clipped()
                HStack {
                    VStack(alignment: .leading) {
                        HStack { // 가게이름, 영업 중 / 영업 종료 이미지
                            Text(dataset.placeName)
                                .font(Font.custom("S-CoreDream-6Bold", size: 19))
                                .foregroundColor(.gray01)
                            
                            Image("OnWorking")
                            
                        }
                        // 가게 주소
                        Text(dataset.address)
                            .font(Font.custom("S-CoreDream-5Medium", size: 10))
                            .foregroundColor(.gray01)
                            .padding(.top, -2)
                        
                        HStack { //전화번호이미지, 전화번호
                            Image("PhoneIcon")
                            
                            Text(dataset.shopPhoneNumber)
                                .font(Font.custom("S-CoreDream-5Medium", size: 10))
                                .foregroundColor(.gray01)
                        }
                        .padding(.top, 5)
                        
                        
                        HStack { // 확성기 이미지, // 가게 주소디스크립션
                            Image("MegaPhone")
                            Text(dataset.description)
                                .font(Font.custom("S-CoreDream-5Medium", size: 10))
                                .foregroundColor(.gray01)
                            
                            Spacer()
                            
                            Button {
                                print("cafe save button tapped")
                                if savedChecker {
                                //    deleteCafe(shopId: dataset.id)
                                   // homeViewModel.savedCafeModel.fetchShops(page: 0, size: 10)
                                } else {
                              //      saveCafe(shopId: dataset.id)
                                   // homeViewModel.savedCafeModel.fetchShops(page: 0, size: 10)
                                    savedChecker = true
                                }
                            } label: {
                                VStack {
                                    if savedChecker {
                                        Image("Flag")
                                            .foregroundColor(.primary05)
                                    } else {
                                        Image("Flag")
                                    }
                                    
                                    Text("카페 저장하기")
                                        .font(Font.custom("S-CoreDream-5Medium", size: 6))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.top, -3)
                    }
                    Spacer()
                }
                .offset(y: 50)
                .padding(.horizontal, 20)
                
                Image("CardBackgroundImg")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .offset(x: 80, y: 270)
            }
            .zIndex(1)
            .offset(y: -15)
            .frame(width: UIScreen.main.bounds.width * 8 / 10,
                   height: UIScreen.main.bounds.height * 2.3 / 10)
            
            // MARK: 카드 뷰 하단 정보 부분
            VStack {
                HStack {
                    (Text(dataset.placeName) + Text("의 정보 >"))
                        .font(Font.custom("S-Core Dream", size: 12))
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    
                    Spacer()
                }
                .padding(.leading)
                
                HStack { // 역에서부터의 위치, 별점, 리뷰
                    VStack {
                        Image("FarFrom")
                            .resizable()
                            .frame(width: 18, height: 22)
                        
                        Text(dataset.posFromStation)
                            .font(Font.custom("S-Core Dream", size: 9))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary06)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                    
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(Color("Gray04"))
                    
                    VStack {
                        Image("Star")
                            .resizable()
                            .frame(width: 18, height: 22)
                        
                        Text("\(String(format: "%.2f", Double(dataset.rating))) / 5")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("S-Core Dream", size: 9))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary06)
                    }
                    .padding()
                    
                    Rectangle()
                        .frame(width: 1)
                        .foregroundColor(Color("Gray04"))
                    
                    VStack {
                        Image("Reviews")
                            .resizable()
                            .frame(width: 18, height: 22)
                        
                        Text("리뷰\(dataset.reviewCount) 개")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("S-Core Dream", size: 9))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary06)
                    }
                    .padding()
                }
                .frame(height: 63, alignment: .top)
                
                HStack { // 스테이 어도러블의 요일별 혼잡도
                    Text("\(dataset.placeName)의 요일별 혼잡도")
                        .font(Font.custom("S-Core Dream", size: 12))
                        .foregroundColor(.gray09)
                    
                    Image("Union")
                        .resizable()
                        .frame(width: 10, height: 10)
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.vertical, 10)
                
                HStack { // 요일별 혼잡도 이미지 생성
                    ForEach(0..<dataset.densityOfDays.count, id: \.self) { index in
                        VStack {
                            Text(dayOfWeek(index: index))
                                .font(Font.custom("S-CoreDream-5Medium", size: 9))
                                .padding(.bottom, -2)
                                .onAppear {
                                    print(dayOfWeek(index: index))
                                }
                            
                            Image(imageName(value: dataset.densityOfDays[index]))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20) // 예시 크기, 필요에 따라 조정
                        }
                        .frame(width: 36, height: 52)
                        .background(Color.white) // VStack에 흰색 배경 적용
                        .cornerRadius(5) // 배경의 모서리를 둥글게 처리
                        .shadow(radius: 3) // 그림자 효과 적용
                    }
                }
                .padding(.horizontal, 20)
            }
            .zIndex(2)
            .frame(width: UIScreen.main.bounds.width * 8 / 10,
                   height: UIScreen.main.bounds.height * 3 / 10)
            .offset(y: -50)
            .background(Color.clear)
        }
        .background(Color.white)
        .cornerRadius(16)
        .frame(width: UIScreen.main.bounds.width * 8 / 10,
               height: UIScreen.main.bounds.height * 5 / 10)
    }
}

func dayOfWeek(index: Int) -> String {
    switch index {
    case 0: return "월"
    case 1: return "화"
    case 2: return "수"
    case 3: return "목"
    case 4: return "금"
    case 5: return "토"
    case 6: return "일"
    default: return ""
    }
}

// 값에 따른 이미지 이름 반환
func imageName(value: Int) -> String {
    switch value {
    case 1: return "icon_home_crowd_low" // 1일 때 "low" 이미지
    case 2: return "icon_home_crowd_middle" // 2일 때 "middle" 이미지
    case 3: return "icon_home_crowd_high" // 3일 때 "high" 이미지
    default: return ""
    }
}
