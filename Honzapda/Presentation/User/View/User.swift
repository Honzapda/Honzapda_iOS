//
//  User.swift
//  Honzapda
//
//  Created by YOUJIM on 2/28/24.
//

import SwiftUI

// MARK: - 마이페이지 메인 뷰

struct UserMainView: View {
    @ObservedObject var userViewModel = UserViewModel()
    // MARK: BODY
    var body: some View {
        NavigationView {
            ScrollView {
                VStack( // 상단 로고
                    alignment: .leading,
                    content: {
                        Image("logo_navigationbar")
                            .padding(EdgeInsets(top: 11, 
                                                leading: 16,
                                                bottom: 0,
                                                trailing: 0)
                            )
                        Divider()
                        Color.white.frame(height: 160)
                    }) //: 상단 로고
                ZStack {
                    Color.gray01.frame(maxHeight: .infinity)
                    VStack {
                        ZStack { // 프로필 이미지
                            Circle()
                                .frame(width: 97, height: 97)
                                .overlay(
                                    Image("image_my_profile_none")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 97, height: 97)
                                        .clipShape(Circle())
                                )
                            
                            Button {
                                print("프로필 사진 변경")
                            } label: {
                                // TODO: 프로필 사진 변경 로직 구현
                                    Image("icon_my_plus_fill")
                                }
                                .offset(x: 35, y: 30)
                        } //: 프로필 이미지
                        .offset(y: -45)
                        
                        Text("짐깅")
                            .font(.custom("S-CoreDream-6Bold", size: 22))
                            .foregroundStyle(Color.primary06)
                            .padding(EdgeInsets(top: 16, 
                                                leading: 0,
                                                bottom: 22,
                                                trailing: 0)
                            )
                            .offset(y: -49)
                        CafeTasteCardView() // 나만의 카페 취향
                        
                        MyCafeCardView() // 내가 찜한 카페
                        
                        Color.gray03.frame(height: 8)
                        VStack(alignment: .leading) { // 설정
                            Text("설정")
                                .font(.custom("S-CoreDream-6Bold", size: 20))
                                .foregroundStyle(Color.gray10)
                                .padding(EdgeInsets(top: 24, 
                                                    leading: 24,
                                                    bottom: 32,
                                                    trailing: 0)
                                )
                            
                            HStack { // 푸시 알림 설정
                                Text("푸시 알림 설정")
                                    .font(.custom("S-CoreDream-5Medium", size: 16))
                                    .foregroundStyle(Color.gray10)
                                    .padding(EdgeInsets(top: 0,
                                                        leading: 24,
                                                        bottom: 0,
                                                        trailing: 0)
                                    )
                                
                                Toggle("", isOn: $userViewModel.isToggle)
                                    .padding(.trailing, 26)
                                    .toggleStyle(SwitchToggleStyle(tint: Color.primary05))
                                    .frame(height: 17)
                            }
                            Divider()
                                .padding(16)
                                .foregroundColor(Color.gray03)
                            
                            NavigationLink( // 도움말
                                destination: HelpMessageView().navigationBarBackButtonHidden()
                            ) {
                                Text("도움말")
                                    .font(.custom("S-CoreDream-5Medium", size: 16))
                                    .foregroundStyle(Color.gray10)
                                    .padding(EdgeInsets(top: 0,
                                                        leading: 24,
                                                        bottom: 0, 
                                                        trailing: 0)
                                    )
                            }
                            Divider()
                                .padding(16)
                                .foregroundColor(Color.gray03)
                            
                            Button { // 개발자 정보
                                print("개발자 정보")
                            } label: {
                                Text("개발자 정보")
                                    .font(.custom("S-CoreDream-5Medium", size: 16))
                                    .foregroundStyle(Color.gray10)
                                    .padding(EdgeInsets(top: 0,
                                                        leading: 24,
                                                        bottom: 0, 
                                                        trailing: 0)
                                    )
                            }
                            Divider()
                                .padding(16)
                                .foregroundColor(Color.gray03)
                            
                            Button { // 로그아웃
                                print("로그아웃")
                            } label: {
                                // TODO: 로그아웃 팝업창 연결
                                Text("로그아웃")
                                    .font(.custom("S-CoreDream-5Medium", size: 16))
                                    .foregroundStyle(Color.gray10)
                                    .padding(EdgeInsets(top: 0,
                                                        leading: 24,
                                                        bottom: 0,
                                                        trailing: 0)
                                    )
                            }
                            
                            Divider()
                                .padding(16)
                                .foregroundColor(Color.gray03)
  
                            Button { // 서비스 탈퇴
                                print("서비스 탈퇴")
                            } label: {
                                Text("서비스 탈퇴")
                                    .font(.custom("S-CoreDream-5Medium", size: 16))
                                    .foregroundStyle(Color.gray10)
                                    .padding(EdgeInsets(top: 0,
                                                        leading: 24,
                                                        bottom: 0, 
                                                        trailing: 0)
                                    )
                            }
                            Divider()
                                .padding(16)
                                .foregroundColor(Color.gray03)
                        } //: 설정
                        .padding(.bottom, 48)
                    }
                }
            } //: ScrollView
            
         
        }
    }
}

// MARK: - 나만의 카페 취향
struct CafeTasteCardView: View {
    // MARK: BODY
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("나만의 카페 취향")
                            .foregroundColor(Color.gray10)
                            .font(.custom("S-CoreDream-6Bold", size: 18))
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: MyCafeTasteView().navigationBarBackButtonHidden(true)
                        ) {
                            Text("수정")
                                .font(.custom("S-CoreDream-5Medium", size: 12))
                                .foregroundColor(Color.gray05)
                        }
                    }
                    .padding(.bottom, 4)
                    
                    Text("카페 취향은 큐레이션 시 사용되며, 언제든지 변경할 수 있어요!")
                        .font(.custom("S-CoreDream-5Medium", size: 10))
                        .foregroundColor(Color.gray07)
                        .padding(.bottom, 10)
                    
                    ScrollView(.horizontal) { // 카페 취향 키워드 ScrollView
                        HStack {
                            // TODO: api 결과 값에 따라 보여줄 ViewModel 적용
                            Button("적당한 공간") {
                                print("적당한 공간")
                            }
                            .buttonStyle(CafeTasteButton())
                        }
                    } //: 카페 취향 키워드 ScrollView
                }
                .padding(EdgeInsets(top: 30,
                                    leading: 24,
                                    bottom: 16,
                                    trailing: 24)
                )
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 2)
        }
        .padding(EdgeInsets(top: -50,
                            leading: 16,
                            bottom: 20,
                            trailing: 16)
        )
    }
}

// MARK: - 카페 취향 키워드 버튼 스타일
struct CafeTasteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("S-CoreDream-5Medium", size: 12))
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 8,
                                leading: 16,
                                bottom: 8,
                                trailing: 16)
            )
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.primary05)
            )
    }
}

// MARK: - 내가 찜한 카페
struct MyCafeCardView: View {
    // MARK: BODY
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    HStack {
                        NavigationLink(
                            destination: MyCafeView().navigationBarBackButtonHidden()
                        ) {
                            Text("내가 찜한 카페")
                                .foregroundColor(Color.gray10)
                                .font(.custom("S-CoreDream-6Bold", size: 18))
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 4, height: 7)
                                .foregroundColor(.black)
                        } //: NavigationLink
                    }
                    .padding(.bottom, 7)
                    
                    Text("내가 찜한 카페 리스트를 확인할 수 있어요.")
                        .font(.custom("S-CoreDream-5Medium", size: 10))
                        .foregroundColor(Color.gray07)
                        .padding(.bottom, 10)
                    
                    ScrollView(.horizontal) { // 찜한 카페 ScrollView
                        HStack {
                            // TODO: api 결과 값에 따라 보여줄 ViewModel 적용
                            MyCafeCardCellView() // 찜한 카페 셀
                        }
                    } //: 찜한 카페 ScrollView
                }
                .padding(24)
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 2)
        }
        .padding(EdgeInsets(top: 0,
                            leading: 16,
                            bottom: 24,
                            trailing: 16)
        )
    }
}

// MARK: - 찜한 카페 셀
struct MyCafeCardCellView: View {
    // MARK: BODY
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("cafe1")
                .resizable()
                .frame(width: 102, height: 144)
            
            Text("필아웃커피 보정점")
                .font(.custom("S-CoreDream-6Bold", size: 12))
                .foregroundColor(Color.white)
                .padding(EdgeInsets(top: 0,
                                    leading: 6,
                                    bottom: 8,
                                    trailing: 0)
                )
        }
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    UserMainView()
}
