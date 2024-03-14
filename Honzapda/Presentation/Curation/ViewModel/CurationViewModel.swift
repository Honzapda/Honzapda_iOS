//
//  CurationViewModel.swift
//  Honzapda
//
//  Created by 이재용 on 3/14/24.
//

import SwiftUI

class CurationViewModel : ObservableObject {
    // MARK: Properties
    /*
     gotoTest -> 큐레이션 메인 뷰에서 큐레이션 테스트로 넘어가는 것 컨트롤 t-> 테스트뷰 f-> 메인뷰
     progress -> 테스트뷰 순서 반영
     mood -> 테스트 1에서 변동
     keyword -> 테스트2에서 변동
     menu -> 테스트 3에서 변동
     atmosphere -> 테스트 4에서 변동
     curationBodyViewDataset  -> 바디 뷰에 쓰이는 데이터셋
     
     */
    @Published var gotoTest : Bool = false
    @Published var progress : Int = 0
    @Published var mood : String = "none"
    @Published var keyword : String = "none"
    @Published var menu : String = "none"
    @Published var atmosphere : String = "none"
    
    
    // MARK: 큐레이션 바디 뷰 데이터셋 셈플

    let cuData: CurationBVdataset = CurationBVdataset(title: "오늘의\n카페 추천",
                                                       subtitle: "오늘은 어디 가지?\n카페 고르기 힘들 때, HONZAPDA에서 추천해드려요!",
                                                       cafeImgArr: ["image_curationmain_cafesample1",
                                                                    "image_curationmain_cafesample2",
                                                                    "image_curationmain_cafesample3"],
                                                       cafeTitleArr: ["오늘\n내 취향에 맞는\n혼잡도 낮은 카페",
                                                                      "오늘\n내 취향에 맞는\n혼잡도 높은 카페",
                                                                      "오늘\n내 취향에 맞는\n딱 맞는 카페"],
                                                       cafeNumberArr: [1, 2, 3])
    let cuData2: CurationBVdataset = CurationBVdataset(title: "나와 어울리는\n카페 추천",
                                                        subtitle: "나 혼자 조용히 공부할 장소가 필요한데 디저트는 먹고 싶고,\n친구랑 떠들고 싶은데 너무 조용한 카페는 눈치 보이고,\n어떤 카페 가지? HONZAPDA에서 추천해드려요!",
                                                        cafeImgArr: ["image_curationmain_cafesample1",
                                                                     "image_curationmain_cafesample2",
                                                                     "image_curationmain_cafesample3"],
                                                        cafeTitleArr: ["", "", ""],
                                                        cafeNumberArr: nil)
    let cuData3: CurationBVdataset = CurationBVdataset(title: "카페\n큐레이션 모음",
                                                        subtitle: "오늘의 카페 추천도,\n상황별 카페 추천도 부족하다면?\nHONZAPDA에서 준비한 카페 큐레이션 모음을 활용하세요!",
                                                        cafeImgArr: ["image_curationmain_cafesample1",
                                                                     "image_curationmain_cafesample2",
                                                                     "image_curationmain_cafesample3",
                                                                     "image_curationmain_cafesample4"],
                                                        cafeTitleArr: ["추운 겨울에\n어울리는\n카페들",
                                                                       "오늘 좀 감성 터지고 싶은 날,\n가기 좋은 카페",
                                                                       "날이 추운 날,\n카공하기 좋은 카페",
                                                                       "공간대여 하기 좋은 카페"],
                                                        cafeNumberArr: [1, 2, 3, 4])

    
    
    
    
}
