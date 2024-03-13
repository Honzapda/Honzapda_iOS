//
//  Common.swift
//  Honzapda
//
//  Created by YOUJIM on 3/13/24.
//

import Foundation


struct Common {
    static let carouselList: [CarouselModel] = [
        CarouselModel(
            id: 0,
            originalText: "카페에서 공부는\n포기할 수 없으니까!",
            highlightedText: "공부",
            captionText: "어느 카페 가지? 자리가 있을까?\n더 이상 고민하지 마세요.",
            imageName: "image_onboarding_study"),
        CarouselModel(
            id: 1,
            originalText: "카페에서 자리는\n포기할 수 없으니까!",
            highlightedText: "자리",
            captionText: "어느 카페 가지? 자리가 있을까?\n더 이상 고민하지 마세요.",
            imageName: "image_onboarding_seat"),
        CarouselModel(
            id: 2,
            originalText: "카페에서 분위기는\n포기할 수 없으니까!",
            highlightedText: "분위기",
            captionText: "조용한 분위기? 약간은 시끄러운 분위기?\n혼잡다에서 미리 살펴보세요!",
            imageName: "image_onboarding_mood"),
        CarouselModel(
            id: 3,
            originalText: "카페에서 콘센트는\n포기할 수 없으니까!",
            highlightedText: "콘센트",
            captionText: "충전해야 하는데 가능할까?\n혼잡다에서 확인할 수 있어요 :)",
            imageName: "image_onboarding_plug")
    ]
}
