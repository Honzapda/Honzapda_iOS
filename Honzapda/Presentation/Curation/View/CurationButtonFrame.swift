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

#Preview(body: {
    CurationTestView3(curationViewModel: CurationViewModel())
})
// 큐레이션 테스트1을 위한 버튼 생성기
struct CurationTestButtonLabelCreater: View {
    let num: Int

    var body: some View {
        if num < 4 {
            ZStack {
                Image(imageName(for: num))
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                HStack {
                    Text(text(for: num))
                        .font(.sCoreDream(.bold, size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading, 30)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
        } else {
            ZStack {
                Image(imageName(for: num))
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                
                HStack {
                    Text(text(for: num))
                        .font(.sCoreDream(.bold, size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading, 30)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .overlay {
                Rectangle()
                    .foregroundStyle(.white)
                    .opacity(0.5)
            }
        }
    }
        

    private func imageName(for num: Int) -> String {
        switch num {
        case 1: return "button_curationTest_mood_good"
        case 2: return "button_curationTest_mood_soso"
        case 3: return "button_curationTest_mood_bad"
        case 4: return "button_curationTest_mood_good"
        case 5: return "button_curationTest_mood_soso"
        case 6: return "button_curationTest_mood_bad"
        default: return "button_curationTest_mood_good" // 기본 이미지
        }
    }

    private func text(for num: Int) -> String {
        switch num {
        case 1: return "좋아요!\n카페 가기 좋은 날이에요 :)"
        case 2: return "좋지도 나쁘지도 않은\n보통의 기분이에요 :|"
        case 3: return "기분이 좋지 않아\n기분 전환이 필요해요 :("
        case 4: return "좋아요!\n카페 가기 좋은 날이에요 :)"
        case 5: return "좋지도 나쁘지도 않은\n보통의 기분이에요 :|"
        case 6: return "기분이 좋지 않아\n기분 전환이 필요해요 :("
        default: return "기본 메시지" // 기본 메시지
        }
    }
}

// 큐레아션 테스트2의 비선택 버튼 생성기
struct CurationTestSmallButtonLabelCreater: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.sCoreDream(.medium, size: 20))
            .foregroundColor(.primary06)
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
            .font(.sCoreDream(.medium, size: 20))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(.primary05)
                    .shadow(radius: 3, x: 1, y: 3)
            )
            .padding(EdgeInsets(top: 0, leading: 4, bottom: 6, trailing: 4))
            .fixedSize(horizontal: true, vertical: false)
    }
}

// 큐레이션 테스트 3를 위한 버튼 생성기
struct CurationTestButtonLabelCreater2: View {
    let num: Int

    var body: some View {
        ZStack {
            if num == 1 {
                Image(imageName(for: num))
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
                    .padding(.bottom, 15)
            } else {
                Image(imageName(for: num))
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)
            }
            
            HStack {
                Text(text(for: num))
                    .font(.sCoreDream(.bold, size: 16))
                    .foregroundColor(color(for: num))
                    .multilineTextAlignment(.leading)
                    
                Spacer()
            }
            .padding(.leading, padding(for: num))
            
        }
        .frame(width: frameWidth(for: num))
    }

    private func imageName(for num: Int) -> String {
        switch num {
        case 1: return "button_curationTest_menu_coffee"
        case 2: return "button_curationTest_menu_beverage"
        case 3: return "button_curationTest_menu_dessert"
        case 4: return "button_curationTest_menu_coffeefill"
        case 5: return "button_curationTest_menu_beverageFill"
        case 6: return "button_curationTest_menu_dessertFill"
        default: return ""
        }
    }

    private func text(for num: Int) -> String {
        switch num {
        case 1, 4: return "카페의 정석!\n커피 메뉴"
        case 2, 5: return "그래도 당 충전은 해야지!\n달달한 음료 메뉴"
        case 3, 6: return "카페는 디저트지!\n디저트 메뉴"
        default: return ""
        }
    }

    private func color(for num: Int) -> Color {
        switch num {
        case 1, 4: return .primary05
        case 2, 5: return .second105
        case 3, 6: return .second205
        default: return .black
        }
    }

    private func padding(for num: Int) -> CGFloat {
        switch num {
        case 1, 4: return 20
        case 2, 5: return 25
        case 3, 6: return 25
        default: return 0
        }
    }

    private func frameWidth(for num: Int) -> CGFloat {
        switch num {
        case 1: return UIScreen.main.bounds.width * 0.85
        default: return UIScreen.main.bounds.width * 0.9
        }
    }
}

// 큐레이션 테스트 4를 위한 버튼 생성기
struct CurationTestButtonLabelCreater3: View {
    let num: Int
    
    var body: some View {
        ZStack {
            Image(imageName(for: num))
                .resizable()
                .frame(width: 99, height: 134)
                .shadow(radius: 3)
            
            Text(text(for: num))
                .font(.sCoreDream(.medium, size: 12))
                .foregroundColor(color(for: num))
                .multilineTextAlignment(.center)
                .offset(y: 20)
        }
    }
    
    private func imageName(for num: Int) -> String {
        switch num {
        case 1: return "button_curationTest_atmosphere_silent"
        case 2: return "button_curationTest_atmosphere_noisy"
        case 3: return "button_curationTest_atmosphere_hotplace"
        case 4: return "button_curationTest_atmosphere_silentFill"
        case 5: return "button_curationTest_atmosphere_noisyFill"
        case 6: return "button_curationTest_atmosphere_hotplaceFill"
        default: return ""
        }
    }
    
    private func text(for num: Int) -> String {
        switch num {
        case 1, 4: return "쾌적하고\n조용한 분위기"
        case 2, 5: return "적당한\n소음"
        case 3, 6: return "활기찬\n핫플레이스"
        default: return ""
        }
    }
    
    private func color(for num: Int) -> Color {
        switch num {
        case 1, 4: return .primary05
        case 2, 5: return .second105
        case 3, 6: return .second205
        default: return .black
        }
    }
}

//struct CustomTextStyleModifier: ViewModifier {
//    var color: Color
//    func body(content: Content) -> some View {
//        content
//            .font()
//            .foregroundColor(color)
//            .multilineTextAlignment(.leading)
//    }
//}
