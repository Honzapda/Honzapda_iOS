//
//  SignUpCurationViewModel.swift
//  Honzapda
//
//  Created by 송영훈 on 6/4/24.
//

import Foundation

class SignUpCurationViewModel: ObservableObject {
    @Published var signUpCurationModel: [SignUpCurationModel] = [
        SignUpCurationModel(title: "1층"), SignUpCurationModel(title: "테이크아웃"), SignUpCurationModel(title: "잔잔한"),
        SignUpCurationModel(title: "친목"), SignUpCurationModel(title: "2층"), SignUpCurationModel(title: "카페 탐방"),
        SignUpCurationModel(title: "휴식"), SignUpCurationModel(title: "시끄러운"), SignUpCurationModel(title: "아늑한"),
        SignUpCurationModel(title: "공부"), SignUpCurationModel(title: "핫플레이스"), SignUpCurationModel(title: "3층"),
        SignUpCurationModel(title: "친목 모임"), SignUpCurationModel(title: "회의"), SignUpCurationModel(title: "팀플"),
        SignUpCurationModel(title: "편안한 좌석"), SignUpCurationModel(title: "넓은 책상"), SignUpCurationModel(title: "저렴한 가격"),
        SignUpCurationModel(title: "각진 책상"), SignUpCurationModel(title: "무난한 가격"), SignUpCurationModel(title: "작업"),
        SignUpCurationModel(title: "좁은 책상"), SignUpCurationModel(title: "좁은 공간"), SignUpCurationModel(title: "깨끗한"),
        SignUpCurationModel(title: "청결도 상관 없음"), SignUpCurationModel(title: "딱딱한 좌석"), SignUpCurationModel(title: "독서"),
        SignUpCurationModel(title: "적당한 공간"), SignUpCurationModel(title: "어두운 조명"), SignUpCurationModel(title: "재즈 음악"),
        SignUpCurationModel(title: "넉넉한 콘센트"), SignUpCurationModel(title: "적당한 조명"), SignUpCurationModel(title: "힐링"),
        SignUpCurationModel(title: "밝은 조명"), SignUpCurationModel(title: "클래식 음악"), SignUpCurationModel(title: "잔잔한 음악"),
        SignUpCurationModel(title: "콘센트 개수 상관 없음"), SignUpCurationModel(title: "가격대가 있는"),
        SignUpCurationModel(title: "넓은 공간"),  SignUpCurationModel(title: "둥근 책상"),  SignUpCurationModel(title: "코딩")]
}
