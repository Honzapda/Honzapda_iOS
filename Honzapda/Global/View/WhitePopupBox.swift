//
//  WhitePopupBox.swift
//  Honzapda
//
//  Created by 송영훈 on 5/12/24.
//

import SwiftUI

struct WhitePopupBox: View {
    @State var popupData: PopupData!
    
    var body: some View {
        popupView()
            .padding(.horizontal, 36)
    }
    
    @ViewBuilder
    private func popupView() -> some View {
        switch popupData {
        case .sadTitleOneButton(let _1, let _2, let _3):
            SadTitleOneButton(title: _1,
                              btnTitle: _2,
                              btnAction: _3)
        case .titleDetail(let _1, let _2, let _3, let _4):
            TitleDetail(title: _1,
                        detail: _2,
                        btnTitle: _3,
                        btnAction: _4)
        case .smileTitleDetailWithXButton(let _1, let _2):
            SmileTitleDetailWithXButton(title: _1,
                                        detail: _2)
        case .sosoTitleWithTwoButton(let _1, let _2, let _3, let _4, let _5):
            SosoTitleWithTwoButton(title: _1,
                                   firstBtnTitle: _2,
                                   secondBtnTitle: _3,
                                   firstBtnAction: _4,
                                   secondBtnAction: _5)
        case .sadTitleDetailWithTwoButton(let _1, let _2, let _3, let _4, let _5, let _6):
            SadTitleDetailWithTwoButton(title: _1,
                                        detail: _2,
                                        firstBtnTitle: _3,
                                        secondBtnTitle: _4,
                                        firstBtnAction: _5,
                                        secondBtnAction: _6)
        case .smileTitleWithTwoButton(let _1, let _2, let _3, let _4, let _5):
            SmileTitleWithTwoButton(title: _1,
                                    firstBtnTitle: _2,
                                    secondBtnTitle: _3,
                                    firstBtnAction: _4,
                                    secondBtnAction: _5)
        case .none:
            Text("None text view")
        }
        
    }
}




public enum PopupData {
    case sadTitleOneButton(_ title: String,
                           _ btnTitle: String,
                           _ btnAction: (() -> Void))
    case titleDetail(_ title: String,
                     _ detail: String,
                     _ btnTitle: String,
                     _ btnAction: (() -> Void))
    case smileTitleDetailWithXButton(_ title: String, 
                                     _ detail: String)
    case sosoTitleWithTwoButton(_ title: String,
                                _ firstBtnTitle: String,
                                _ secondBtnTitle: String,
                                _ firstBtnAction: (() -> Void),
                                _ secondBtnAction: (() -> Void))
    case sadTitleDetailWithTwoButton(_ title: String,
                                     _ detail: String,
                                     _ firstBtnTitle: String,
                                     _ secondBtnTitle: String,
                                     _ firstBtnAction: (() -> Void),
                                     _ secondBtnAction: (() -> Void))
    case smileTitleWithTwoButton(_ title: String,
                                 _ firstBtnTitle: String,
                                 _ secondBtnTitle: String,
                                 _ firstBtnAction: (() -> Void),
                                 _ secondBtnAction: (() -> Void))
}

struct SadTitleOneButton: View {
    var title: String
    var btnTitle: String
    var btnAction: (() -> Void)
    
    var body: some View {
        VStack {
            Image("Cafe/sad_emoji")
                .frame(width: 96, height: 97)
                .rotationEffect(Angle(degrees: -6.63))
                .padding(.top, 24)
                .padding(.bottom,16)
            Text(title)
                .font(.sCoreDream(.bold, size: 18))
                .foregroundColor(.primary06)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 52)
                .padding(.vertical, 8)
            Primary05Button(text: btnTitle,
                            hEdgeSize: 24,
                            clicked: btnAction)
                .padding(.vertical, 24)
        }
        .background(.white)
        .cornerRadius(16)
    }
}

struct TitleDetail: View {
    var title: String
    var detail: String
    var btnTitle: String
    var btnAction: (() -> Void)
    
    var body: some View {
        VStack {
            Text(title)
                .font(.sCoreDream(.bold, size: 20))
                .foregroundColor(.primary06)
            Text(detail)
                .font(.sCoreDream(.medium, size: 12))
                .foregroundColor(.gray08)
                .multilineTextAlignment(.center)
            Primary05Button(text: btnTitle,
                            hEdgeSize: 16,
                            clicked: btnAction)
            .padding(.bottom, 24)
            
        }
        .background(.white)
        .cornerRadius(16)
    }
}

struct SmileTitleDetailWithXButton: View {
    var title: String
    var detail: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "xmakr")
                    .frame(width: 14, height: 14)
                    .padding(.trailing, 24)
                    .padding(.top, 24)
            }
            Image("Cafe/smile_emoji")
                .frame(width: 96, height: 97)
                .rotationEffect(Angle(degrees: 10.18))
                .padding(.bottom, 24)
            Text(title)
                .font(.sCoreDream(.bold, size: 20))
                .foregroundColor(.primary06)
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            Text(detail)
                .font(.sCoreDream(.medium, size: 12))
                .foregroundColor(.gray08)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
        }
        .background(.white)
        .cornerRadius(16)
    }
}

struct SosoTitleWithTwoButton: View {
    var title: String
    var firstBtnTitle: String
    var secondBtnTitle: String
    var firstBtnAction: (() -> Void)
    var secondBtnAction: (() -> Void)
    
    var body: some View {
        VStack {
            Image("Cafe/soso_emoji")
                .frame(width: 95, height: 100)
                .padding(.top, 40)
            Text(title)
                .font(.sCoreDream(.bold, size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary06)
                .padding(.top, 24)
            HStack {
                Gray03HalfButton(text: firstBtnTitle,
                             clicked: firstBtnAction)
                Primary05HalfButton(text: secondBtnTitle,
                                clicked: secondBtnAction)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 16)
        }
        .background(.white)
        .cornerRadius(16)
    }
}

struct SadTitleDetailWithTwoButton: View {
    var title: String
    var detail: String
    var firstBtnTitle: String
    var secondBtnTitle: String
    var firstBtnAction: (() -> Void)
    var secondBtnAction: (() -> Void)
    
    var body: some View {
        VStack {
            Image("Cafe/sad_emoji")
                .frame(width: 96, height: 97)
                .rotationEffect(Angle(degrees: -6.63))
                .padding(.top, 40)
            Text(title)
                .font(.sCoreDream(.bold, size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary06)
                .padding(.top, 24)
            Text(detail)
                .font(.sCoreDream(.medium, size: 12))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray08)
            HStack {
                Gray03HalfButton(text: firstBtnTitle,
                             clicked: firstBtnAction)
                Primary05HalfButton(text: secondBtnTitle,
                                clicked: secondBtnAction)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 16)
        }
        .background(.white)
        .cornerRadius(16)
    }
}

struct SmileTitleWithTwoButton: View {
    var title: String
    var firstBtnTitle: String
    var secondBtnTitle: String
    var firstBtnAction: (() -> Void)
    var secondBtnAction: (() -> Void)
    
    var body: some View {
        VStack {
            Image("Cafe/smile_emoji")
                .frame(width: 96, height: 97)
                .rotationEffect(Angle(degrees: 10.18))
                .padding(.top, 40)
            Text(title)
                .font(.sCoreDream(.bold, size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary06)
                .padding(.top, 24)
            HStack {
                Gray03HalfButton(text: firstBtnTitle,
                             clicked: firstBtnAction)
                Primary05HalfButton(text: secondBtnTitle,
                                clicked: secondBtnAction)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 16)
        }
        .background(.white)
        .cornerRadius(16)
    }
}
