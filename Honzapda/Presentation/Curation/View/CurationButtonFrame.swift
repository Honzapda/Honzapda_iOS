//
//  CurationButtonFrame.swift
//  Honzapda
//
//  Created by 이재용 on 3/9/24.
//

import SwiftUI

//: MARK: 버튼 모양 생성 구조체
// if-else로 생성했고 1~3 -> 비선택시 4~6 -> 선택시 버튼 이미지로 할당
// 단 큐레이션테스트 1의 경우 버튼 선택시 선택 된 버튼 외의 요소들에 블러가 들어가기 때문에 통일성을 가지기 위해 반대로 구성함
// 즉, 선택 동작이 작용된 버튼 레이블이 456, 선택 동작이 적용되지 않은 경우가 123이다.

// 큐레이션 테스트1을 위한 버튼 생성기
struct CurationTestButtonLabelCreater: View {
    let num: Int
    var body: some View {
        if num == 1 {
            ZStack {
                Image("button_curationTest_mood_good")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("좋아요!\n카페 가기 좋은 날이에요 :)")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .offset(x: -60)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 2 {
            ZStack {
                Image("button_curationTest_mood_soso")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("좋지도 나쁘지도 않은\n보통의 기분이에요 :|")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .offset(x: -70)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 3 {
            ZStack {
                Image("button_curationTest_mood_bad")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("기분이 좋지 않아\n기분 전환이 필요해요 :(")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .offset(x: -70)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 4 {
            ZStack {
                Image("button_curationTest_mood_good")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("좋아요!\n카페 가기 좋은 날이에요 :)")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .offset(x: -60)
                
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                    .scaledToFill()
                    .frame(height: 110)
                    .cornerRadius(10)
                    .offset(y: 2)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 5 {
            ZStack {
                Image("button_curationTest_mood_soso")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("좋지도 나쁘지도 않은\n보통의 기분이에요 :|")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .offset(x: -70)
                
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                    .scaledToFill()
                    .frame(height: 110)
                    .cornerRadius(10)
                    .offset(y: 2)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 6 {
            ZStack {
                Image("button_curationTest_mood_bad")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("기분이 좋지 않아\n기분 전환이 필요해요 :(")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .offset(x: -70)
                
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                    .scaledToFill()
                    .frame(height: 110)
                    .cornerRadius(10)
                    .offset(y: 2)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
    }
}

// 큐레아션 테스트2의 비선택 버튼 생성기
struct CurationTestSmallButtonLabelCreater: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.custom("S-CoreDream-5Medium", size: 18))
            .foregroundColor(Color("Primary05"))
            .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                    .shadow(radius: 3, x: 1, y: 3)
            )
            .padding(EdgeInsets(top: 0, leading: 4, bottom: 6, trailing: 4))
            .fixedSize(horizontal: true, vertical: false)
    }
}

// 큐레아션 테스트2의 선택된 버튼 생성기
struct CurationTestSmallButtonLabelCreater2: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.custom("S-CoreDream-5Medium", size: 18))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color("Primary05"))
                    .shadow(radius: 3, x: 1, y: 3)
            )
            .padding(EdgeInsets(top: 0, leading: 4, bottom: 6, trailing: 4))
            .fixedSize(horizontal: true, vertical: false)
    }
}

// 큐레이션 태스트 3을 위한 버튼 생성기
struct CurationTestButtonLabelCreater2: View {
    let num: Int
    var body: some View {
         if num == 1 {
            ZStack {
                Image("button_curationTest_menu_coffee")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("카페의 정석!\n커피 메뉴")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(Color(red: 0.29, green: 0.32, blue: 0.91))
                    .multilineTextAlignment(.leading)
                    .offset(x: -90)
            }
            .frame(width: UIScreen.main.bounds.width * 0.85)
             
        } else if num == 2 {
            ZStack {
                Image("button_curationTest_menu_beverage")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("그래도 당 충전은 해야지!\n달달한 음료 메뉴")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(Color(red: 0.54, green: 0.9, blue: 0.72))
                    .multilineTextAlignment(.leading)
                    .offset(x: -50)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 3 {
            ZStack {
                Image("button_curationTest_menu_dessert")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("카페는 디저트지!\n디저트 메뉴")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(Color(red: 0.95, green: 0.54, blue: 0.41))
                    .multilineTextAlignment(.leading)
                    .offset(x: -80)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 4 {
            ZStack {
                Image("button_curationTest_menu_coffeefill")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("카페의 정석!\n커피 메뉴")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(Color(red: 0.29, green: 0.32, blue: 0.91))
                    .multilineTextAlignment(.leading)
                    .offset(x: -90)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 5 {
            ZStack {
                Image("button_curationTest_menu_beveragefill")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("그래도 당 충전은 해야지!\n달달한 음료 메뉴")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(Color(red: 0.54, green: 0.9, blue: 0.72))
                    .multilineTextAlignment(.leading)
                    .offset(x: -50)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        } else if num == 6 {
            ZStack {
                Image("button_curationTest_menu_dessertfill")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                Text("카페는 디저트지!\n디저트 메뉴")
                    .font(Font.custom("S-CoreDream-6Bold", size: 16))
                    .foregroundColor(Color(red: 0.95, green: 0.54, blue: 0.41))
                    .multilineTextAlignment(.leading)
                    .offset(x: -80)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            
        }
    }
}

// 큐레이션 테스트 4를 위한 버튼 생성기
struct CurationTestButtonLabelCreater3: View {
    let num: Int
    var body: some View {
         if num == 1 {
            ZStack {
                Image("button_curationTest_atmosphere_silent")
                    .resizable()
                    .frame(width: 99, height: 134)
                    .shadow(radius: 3)
                
                Text("쾌적하고\n조용한 분위기")
                    .font(Font.custom("S-Core Dream", size: 10))
                    .foregroundColor(Color(red: 0.29, green: 0.32, blue: 0.91))
                    .multilineTextAlignment(.center)
                    .offset(y: 20)
            }
             
        } else if num == 2 {
            ZStack {
                Image("button_curationTest_atmosphere_noisy")
                    .resizable()
                    .frame(width: 99, height: 134)
                    .shadow(radius: 3)
                
                Text("적당한\n소음")
                    .font(Font.custom("S-Core Dream", size: 10))
                    .foregroundColor(Color(red: 0.54, green: 0.9, blue: 0.72))
                    .multilineTextAlignment(.center)
                    .offset(y: 20)
            }
            
        } else if num == 3 {
            ZStack {
                Image("button_curationTest_atmosphere_hotplace")
                    .resizable()
                    .frame(width: 99, height: 134)
                    .shadow(radius: 3)
                
                Text("활기찬\n핫플레이스")
                    .font(Font.custom("S-Core Dream", size: 10))
                    .foregroundColor(Color(red: 0.95, green: 0.54, blue: 0.41))
                    .multilineTextAlignment(.center)
                    .offset(y: 20)
            }
            
        } else if num == 4 {
            ZStack {
                Image("button_curationTest_atmosphere_silentfill")
                    .resizable()
                    .frame(width: 99, height: 134)
                    .shadow(radius: 3)
                
                Text("쾌적하고\n조용한 분위기")
                    .font(Font.custom("S-Core Dream", size: 10))
                    .foregroundColor(Color(red: 0.29, green: 0.32, blue: 0.91))
                    .multilineTextAlignment(.center)
                    .offset(y: 20)
            }
            
        } else if num == 5 {
            ZStack {
                Image("button_curationTest_atmosphere_noisyfill")
                    .resizable()
                    .frame(width: 99, height: 134)
                    .shadow(radius: 3)
                
                Text("적당한\n소음")
                    .font(Font.custom("S-Core Dream", size: 10))
                    .foregroundColor(Color(red: 0.54, green: 0.9, blue: 0.72))
                    .multilineTextAlignment(.center)
                    .offset(y: 20)
            }
            
        } else if num == 6 {
            ZStack {
                Image("button_curationTest_atmosphere_hotplacefill")
                    .resizable()
                    .frame(width: 99, height: 134)
                    .shadow(radius: 3)
                
                Text("활기찬\n핫플레이스")
                    .font(Font.custom("S-Core Dream", size: 10))
                    .foregroundColor(Color(red: 0.95, green: 0.54, blue: 0.41))
                    .multilineTextAlignment(.center)
                    .offset(y: 20)
            }
        }
    }
}
