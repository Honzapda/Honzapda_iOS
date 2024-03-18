import SwiftUI

//: MARK: 큐레이션 태스트뷰 프레임

struct CurationTestView1: View { // 오늘의 기분은 어떄요
    @ObservedObject var curationViewModel: CurationViewModel

    var body: some View {
        ZStack(alignment: .top) {
            Image("background_curationTest")
                .resizable()
                .scaledToFill()
                .frame(height: screenHeight)
            
            VStack(alignment: .leading, spacing: 30) {
                Text("오늘의 기분은\n어때요?")
                    .font(Font.custom("S-CoreDream-6Bold", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)
                
                if curationViewModel.mood == "none" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            curationViewModel.mood = "good"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 1)
                        }
                        
                        Button {
                            print("normal")
                            curationViewModel.mood = "normal"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 2)
                                .padding(.vertical, 20)
                        }
                        
                        Button {
                            print("bad")
                            curationViewModel.mood = "bad"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 3)
                        }
                    }
                } else if curationViewModel.mood == "good" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            curationViewModel.mood = "good"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 1)
                        }
                        
                        Button {
                            print("normal")
                            curationViewModel.mood = "normal"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 5)
                                .padding(.vertical, 20)
                        }
                        
                        Button {
                            print("bad")
                            curationViewModel.mood = "bad"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 6)
                        }
                    }
                } else if curationViewModel.mood == "normal" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            curationViewModel.mood = "good"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 4)
                        }
                        
                        Button {
                            print("normal")
                            curationViewModel.mood = "normal"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 2)
                                .padding(.vertical, 20)
                        }
                        
                        Button {
                            print("bad")
                            curationViewModel.mood = "bad"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 6)
                        }
                    }
                } else if curationViewModel.mood == "bad" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            curationViewModel.mood = "good"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 4)
                        }
                        
                        Button {
                            print("normal")
                            curationViewModel.mood = "normal"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 5)
                                .padding(.vertical, 20)
                        }
                        
                        Button {
                            print("bad")
                            curationViewModel.mood = "bad"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 3)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .offset(y: screenHeight * 0.23)
        }
    }
}

struct CurationTestView2: View {
   //  @Binding var progress: Int
    // @Binding var keyword: String
    @ObservedObject var curationViewModel: CurationViewModel
    
    let choiceArr: [[String]] = [["휴식", "감성 사진 찍기"],
                                  ["여행", "활발한 대화"],
                                  ["회의", "독서", "업무"],
                                  ["핫플", "공부"]]
    var body: some View {
        ZStack(alignment: .top) {
            Image("background_curationTest")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth)

            VStack(alignment: .leading, spacing: 30) {
                Text("가장 마음에 드는\n키워드를 선택해주세요!")
                    .font(Font.custom("S-CoreDream-6Bold", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)
                    .padding(.bottom, 30)
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    
                    VStack {
                    ForEach(0..<choiceArr.count, id: \.self) { rowIndex in
                        HStack(spacing: 10) {
                            ForEach(choiceArr[rowIndex], id: \.self) { choice in
                                Button {
                                    curationViewModel.keyword = choice
                                    curationViewModel.progress += 1
                                } label: {
                                    if curationViewModel.keyword == choice {
                                        CurationTestSmallButtonLabelCreater2(title: choice)
                                    } else {
                                        CurationTestSmallButtonLabelCreater(title: choice)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9)
            }
            .offset(y: screenHeight * 0.23)
        }
    }
}

struct CurationTestView3: View {
    @ObservedObject var curationViewModel: CurationViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Image("background_curationTest")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth)

            VStack(alignment: .leading, spacing: 30) {
                Text("오늘 먹고 싶은\n메뉴는?")
                    .font(Font.custom("S-CoreDream-6Bold", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)

                // 선택 안됨
                if curationViewModel.menu == "none" {
                    VStack {
                        Button {
                            print( "coffee")
                            curationViewModel.menu = "coffee"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater2(num: 1)
                        }
                        Button {
                            print( "drink")
                            curationViewModel.menu = "drink"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater2(num: 2)
                        }
                        Button {
                            print( "dessert")
                            curationViewModel.menu = "dessert"
                            curationViewModel.progress += 1
                        } label: {
                            CurationTestButtonLabelCreater2(num: 3)
                        }
                    }
                } else {
                    VStack {
                        Button {
                            curationViewModel.menu = "coffee"
                        } label: {
                            if curationViewModel.menu == "coffee"{
                                CurationTestButtonLabelCreater2(num: 4)
                            } else {
                                CurationTestButtonLabelCreater2(num: 1)
                            }
                        }
                        Button {
                            curationViewModel.menu = "drink"
                        } label: {
                            if curationViewModel.menu == "drink"{
                                CurationTestButtonLabelCreater2(num: 5)
                            } else {
                                CurationTestButtonLabelCreater2(num: 2)
                            }
                        }
                        Button {
                            curationViewModel.menu = "dessert"
                        } label: {
                            if curationViewModel.menu == "dessert"{
                                CurationTestButtonLabelCreater2(num: 6)
                            } else {
                                CurationTestButtonLabelCreater2(num: 3)
                            }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .offset(y: screenHeight * 0.23)
        }
    }
}

struct CurationTestView4: View {
    @ObservedObject var curationViewModel: CurationViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Image("background_curationTest")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth)
            
            VStack(alignment: .leading, spacing: 30) {
                Text("오늘 가고 싶은\n카페 분위기를 알려주세요!")
                    .font(Font.custom("S-CoreDream-6Bold", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)

                // 선택 안됨
                if curationViewModel.atmosphare == "none" {
                    HStack(spacing: -5) {
                        Button {
                            print( "quiet")
                            curationViewModel.atmosphare = "quiet"
                            curationViewModel.gotoTest = false
                            curationViewModel.progress = 1
                            curationViewModel.gotoResult = true
                        } label: {
                            CurationTestButtonLabelCreater3(num: 1)
                        }
                        Button {
                            print( "drink")
                            curationViewModel.atmosphare = "drink"
                            curationViewModel.gotoTest = false
                            curationViewModel.progress = 1
                            curationViewModel.gotoResult = true
                        } label: {
                            CurationTestButtonLabelCreater3(num: 2)
                                .padding(.vertical, 20)
                        }
                        Button {
                            print( "dessert")
                            curationViewModel.atmosphare = "dessert"
                            curationViewModel.gotoTest = false
                            curationViewModel.progress = 1
                            curationViewModel.gotoResult = true
                        } label: {
                            CurationTestButtonLabelCreater3(num: 3)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                } else {
                    HStack(spacing: -5) {
                        Button {
                            curationViewModel.atmosphare = "coffee"
                        } label: {
                            if curationViewModel.atmosphare == "coffee"{
                                CurationTestButtonLabelCreater3(num: 4)
                            } else {
                                CurationTestButtonLabelCreater3(num: 1)
                            }
                        }
                        Button {
                            curationViewModel.atmosphare = "drink"
                        } label: {
                            if curationViewModel.atmosphare == "drink"{
                                CurationTestButtonLabelCreater3(num: 5)
                            } else {
                                CurationTestButtonLabelCreater3(num: 2)
                            }
                        }
                        Button {
                            curationViewModel.atmosphare = "dessert"
                        } label: {
                            if curationViewModel.atmosphare == "dessert"{
                                CurationTestButtonLabelCreater3(num: 6)
                            } else {
                                CurationTestButtonLabelCreater3(num: 3)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                }
            }
            .offset(y: screenHeight * 0.23)
            .frame(width: UIScreen.main.bounds.width * 0.9,
                   alignment: .leading)
        }
    }
}
struct CUPV3: PreviewProvider {
    static var previews: some View {
        // CurationBodyView(dataset: cuData)
        CurationTestView1(curationViewModel: CurationViewModel())
        CurationTestView2(curationViewModel: CurationViewModel())
        CurationTestView3(curationViewModel: CurationViewModel())
        CurationTestView4(curationViewModel: CurationViewModel())

    }
}
