//
//  CurationPopUpView.swift
//  Honzapda
//
//  Created by 이재용 on 3/18/24.
//

import SwiftUI

struct TestStartPopUp: View {
    @ObservedObject var curationViewModel: CurationViewModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
                .opacity(0.5)
            // 흰색 사각형과 그 내부 요소들을 포함하는 ZStack
            ZStack(alignment: .center) {
                // 흰색 사각형
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 320, height: 212)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 4)
                
                // 흰색 사각형 위에 요소들을 배치하기 위한 VStack
                VStack(spacing: 16) {
                    // 타이틀
                    Text("테스트를 시작해볼까요?")
                        .font(Font.custom("S-CoreDream-6Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                        .padding(.top, 11)
                    // 서브타이틀
                    Text("테스트는 총 네 단계로 이루어져 있어요.\n테스트에서는 전 단계로 돌아갈 수 없고,\n중간에 테스트를 종료하면 저장되지 않으니 조심하세요!")
                        .font(Font.custom("S-Core Dream", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
                    
                    Button {
                        print("start curation test")
                        curationViewModel.gotoTest = true
                        curationViewModel.testPopup = false
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("Primary05"))
                                .frame(width: 288, height: 40)
                                .cornerRadius(8)
                            Text("유의사항을 확인했어요")
                                .font(Font.custom("S-Core Dream", size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                    }

                }
            }
        }
    }
}

struct CafeListPopUp: View {
    @ObservedObject var curationViewModel: CurationViewModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
                .opacity(0.5)
            // 흰색 사각형과 그 내부 요소들을 포함하는 ZStack
            ZStack(alignment: .top) {
                // 흰색 사각형
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 320, height: 320)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 4)
                HStack {
                    Spacer()
                    
                    Button(action: {
                        print("result popup dismiss")
                        curationViewModel.resultPopup = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .frame(width: 14, height: 14)
                    }
                }
                .frame(width: 300, height: 30, alignment: .top) // HStack에 대한 높이 제한을 설정하여 버튼의 위치를 조정합니다.
                .padding(.top, 10) // 상단 여백 추가
                // 흰색 사각형 위에 요소들을 배치하기 위한 VStack
                VStack(spacing: 16) {
                    // 이미지
                    Image("image_test_smile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                        .padding(.top, 20) // 이미지 상단 여백 조정
                    
                    // 텍스트
                    Text("나와 어울리는\n카페 리스트 생성 완료 :)")
                        .font(Font.custom("S-CoreDream-6Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                        .padding(.top, 11)
                    
                    Text("테스트 결과를 바탕으로 한 카페 리스트가 생성되었어요!\n함께 보러 가볼까요?")
                        .font(Font.custom("S-Core Dream", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
                }
                .frame(width: 320, height: 320) // VStack을 흰색 사각형의 크기에 맞게 조정
            }
        }
    }
}

struct Popupprev: PreviewProvider {
    static var previews: some View {
        TestStartPopUp(curationViewModel: CurationViewModel())
        CafeListPopUp(curationViewModel: CurationViewModel())
    }
}
