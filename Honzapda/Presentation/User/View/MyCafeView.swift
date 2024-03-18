//
//  MyCafeView.swift
//  Honzapda
//
//  Created by 황주연 on 3/3/24.
//

import SwiftUI

// MARK: - 내가 찜한 카페 뷰
struct MyCafeView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userViewModel = UserViewModel()
    
    var backButton: some View { // 뒤로가기 버튼
        Button {
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
            }
        }
    } //: 뒤로가기 버튼
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    backButton.padding(EdgeInsets(top: 0, 
                                                  leading: 16,
                                                  bottom: 5,
                                                  trailing: 0)
                    )
                    
                    Divider()
                    
                    Text("3개의 찜한 카페")
                        .foregroundColor(Color.primary06)
                        .font(.custom("S-CoreDream-6Bold", size: 14))
                        .padding(EdgeInsets(top: 16, 
                                            leading: 24,
                                            bottom: 2,
                                            trailing: 0)
                        )
                    
                    HStack { // 정렬 버튼
                        Button {
                            userViewModel.sortColumn = "distance"
                            print(userViewModel.sortColumn)
                        } label: {
                            Text("거리순")
                                .lineLimit(1)
                                .padding(EdgeInsets(top: 8, 
                                                    leading: 12,
                                                    bottom: 8,
                                                    trailing: 12)
                                )
                                .foregroundColor(
                                    userViewModel.sortColumn == "distance"
                                    ? Color.white
                                    : Color.primary05
                                )
                                .font(.custom("S-CoreDream-5Medium", size: 12))
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(
                                            userViewModel.sortColumn == "distance"
                                            ? Color.primary05
                                            : Color.white
                                        )
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.primary05, lineWidth: 1.3)
                                    )
                                )
                        }
                        .padding(.leading, 24)
                        
                        Button {
                            userViewModel.sortColumn = "review"
                            print(userViewModel.sortColumn)
                        } label: {
                            Text("리뷰순")
                                .lineLimit(1)
                                .padding(EdgeInsets(top: 8,
                                                    leading: 12,
                                                    bottom: 8,
                                                    trailing: 12)
                                )
                                .foregroundColor(
                                    userViewModel.sortColumn == "review"
                                    ? Color.white
                                    : Color.primary05
                                )
                                .font(.custom("S-CoreDream-5Medium", size: 12))
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(
                                            userViewModel.sortColumn == "review"
                                            ? Color.primary05
                                            : Color.white
                                        )
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.primary05, lineWidth: 1.3)
                                    )
                                )
                        }
                        .padding(3)
                        
                        Button {
                            userViewModel.sortColumn = "bookmark"
                            print(userViewModel.sortColumn)
                        } label: {
                            Text("저장순")
                                .lineLimit(1)
                                .padding(EdgeInsets(top: 8,
                                                    leading: 12,
                                                    bottom: 8,
                                                    trailing: 12)
                                )
                                .foregroundColor(
                                    userViewModel.sortColumn == "bookmark"
                                    ? Color.white
                                    : Color.primary05
                                )
                                .font(.custom("S-CoreDream-5Medium", size: 12))
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(
                                            userViewModel.sortColumn == "bookmark"
                                            ? Color.primary05
                                            : Color.white
                                        )
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.primary05, lineWidth: 1.3)
                                    )
                                )
                        }
                        .padding(3)
                        
                        Button {
                            userViewModel.sortColumn = "recommend"
                            print(userViewModel.sortColumn)
                        } label: {
                            Text("추천순")
                                .lineLimit(1)
                                .padding(EdgeInsets(top: 8,
                                                    leading: 12,
                                                    bottom: 8,
                                                    trailing: 12)
                                )
                                .foregroundColor(
                                    userViewModel.sortColumn == "recommend"
                                    ? Color.white
                                    : Color.primary05
                                )
                                .font(.custom("S-CoreDream-5Medium", size: 12))
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(
                                        userViewModel.sortColumn == "recommend"
                                        ? Color.primary05
                                        : Color.white
                                    )
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.primary05, lineWidth: 1.3)
                                    )
                                )
                        }
                        .padding(3)
                        
                        Spacer()
                    } //: 정렬 버튼
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    .padding(.bottom, 8)
                }
                .background(Color.white)
                Spacer()
                
                ScrollView {
                    LazyVStack(spacing: 8) {
                        MyCafeListCardView() // 가게 상세 정보 카드 뷰
                            .buttonStyle(PlainButtonStyle())
                            .padding(8)
                    }
                } //: ScrollView
            }
            .frame(height: UIScreen.main.bounds.height-115)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - 가게 상세 정보 카드 뷰
struct MyCafeListCardView: View {
    @ObservedObject var userViewModel = UserViewModel()
    
    // MARK: BODY
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                // TODO: api 결과 값에 따라 보여줄 ViewModel 적용
                ZStack {
                    Image("cafe1") // 가게 이미지
                        .resizable()
                        .frame(width: 345, height: 160)
                        .clipped()
                    
                    VStack { // 찜 아이콘, 글
                        Spacer()
                        HStack {
                            Spacer()
                            VStack {
                                Image("icon_my_heart_fill")
                                    .padding(4)
                                
                                Text("가게 찜")
                                    .foregroundColor(Color.white)
                                    .font(.custom("S-CoreDream-5Medium", size: 6))
                            }
                            .padding(10)
                        }
                    } //: 찜 아이콘, 글
                }
                
                VStack(alignment: .leading, spacing: 8) { // 가게 정보 텍스트
                    HStack {
                        Text("필아웃커피 보정점")
                            .foregroundColor(Color.gray10)
                            .font(.custom("S-CoreDream-6Bold", size: 16))
                        
                        Text(userViewModel.openNow ? "영업 중" : "휴무")
                            .font(.custom("S-CoreDream-3Light", size: 8))
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 0.5)
                            )
                            .foregroundColor(Color.gray08)
                    }
                    
                    Text("경기 용인시 기흥구 죽전로 15번길 7-5 상가 1층")
                        .font(.custom("S-CoreDream-5Medium", size: 10))
                        .foregroundColor(Color.gray07)
                        .padding(.bottom, 24)
                } //: 가게 정보 텍스트
                .padding(.leading, 24)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 3)
        }
        .padding(EdgeInsets(top: 4,
                            leading: 20,
                            bottom: 4,
                            trailing: 20)
        )
        .frame(width: 345, height: 240)
    }
}

#Preview {
    MyCafeView()
}
