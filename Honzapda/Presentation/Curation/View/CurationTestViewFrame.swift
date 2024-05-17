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
                    .font(.sCoreDream(.bold, size: 28))
                    .foregroundStyle(.primary06)
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
                    .font(.sCoreDream(.bold, size: 28))
                    .foregroundColor(.primary06)
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
                .frame(width: UIScreen.main.bounds.width)

            VStack(alignment: .leading, spacing: 30) {
                Text("오늘 먹고 싶은\n메뉴는?")
                    .font(.sCoreDream(.bold, size: 28))
                    .foregroundStyle(.primary06)
                    .padding(.leading, 14)
                
                menuSelectionView()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .offset(y: UIScreen.main.bounds.height * 0.23)
        }
    }
    
    @ViewBuilder
    private func menuSelectionView() -> some View {
        VStack {
            menuButton(menu: "coffee", selectedImage: 4, defaultImage: 1)
            menuButton(menu: "drink", selectedImage: 5, defaultImage: 2)
            menuButton(menu: "dessert", selectedImage: 6, defaultImage: 3)
        }
    }
    
    private func menuButton(menu: String, selectedImage: Int, defaultImage: Int) -> some View {
        Button {
            if curationViewModel.menu == "none" {
                curationViewModel.progress += 1
            }
            curationViewModel.menu = menu
        } label: {
            CurationTestButtonLabelCreater2(num: curationViewModel.menu == menu ? selectedImage : defaultImage)
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
                .frame(width: UIScreen.main.bounds.width)
            
            VStack(alignment: .leading, spacing: 30) {
                Text("오늘 가고 싶은\n카페 분위기를 알려주세요!")
                    .font(.sCoreDream(.bold, size: 26))
                    .foregroundStyle(.primary06)
                    .padding(.leading, 14)

                HStack(spacing: -5) {
                    atmosphereButton(num: 1, label: "quiet")
                    atmosphereButton(num: 2, label: "drink")
                        .padding(.vertical, 20)
                    atmosphereButton(num: 3, label: "dessert")
                }
                .frame(width: UIScreen.main.bounds.width * 0.9)
            }
            .offset(y: UIScreen.main.bounds.height * 0.23)
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
        }
    }

    private func atmosphereButton(num: Int, label: String) -> some View {
        Button {
            print(label)
            curationViewModel.atmosphare = label
            curationViewModel.gotoTest = false
            curationViewModel.gotoResult = true
        } label: {
            CurationTestButtonLabelCreater3(num: curationViewModel.atmosphare == label ? num + 3 : num)
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
