import SwiftUI

//: MARK: 큐레이션 태스트뷰 프레임

struct CurationTestView1: View { // 오늘의 기분은 어떄요
    @Binding var progress: Int
    @Binding var mood: String
    var body: some View {
        ZStack {
            Image("background_curationtest")
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 30) {
                Text("오늘의 기분은\n어때요?")
                    .font(Font.custom("S-Core Dream", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)
                if mood == "none" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            mood = "good"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 1)
                        }
                        Button {
                            print("normal")
                            mood = "normal"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 2)
                                .padding(.vertical, 20)
                        }
                        Button {
                            print("bad")
                            mood = "bad"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 3)
                        }
                    }
                } else if mood == "good" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            mood = "good"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 1)
                        }
                        Button {
                            print("normal")
                            mood = "normal"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 5)
                                .padding(.vertical, 20)
                        }
                        Button {
                            print("bad")
                            mood = "bad"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 6)
                        }
                    }
                } else if mood == "normal" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            mood = "good"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 4)
                        }
                        Button {
                            print("normal")
                            mood = "normal"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 2)
                                .padding(.vertical, 20)
                        }
                        Button {
                            print("bad")
                            mood = "bad"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 6)
                        }
                    }
                } else if mood == "bad" {
                    VStack(spacing: -5) {
                        Button {
                            print("good")
                            mood = "good"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 4)
                        }
                        Button {
                            print("normal")
                            mood = "normal"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 5)
                                .padding(.vertical, 20)
                        }
                        Button {
                            print("bad")
                            mood = "bad"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater(num: 2)
                        }
                    }
                }
            }
        }
    }
}

struct CurationTestView2: View {
    @Binding var progress: Int
    @Binding var keyword: String
    let choiceArr: [[String]] = [["휴식", "감성 사진 찍기"],
                                  ["여행", "활발한 대화"],
                                  ["회의", "독서", "업무"],
                                  ["핫플", "공부"]]
    var body: some View {
        ZStack(alignment: .top) {
            Image("background_curationtest")
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 30) {
                Text("가장 마음에 드는\n키워드를 선택해주세요!")
                    .font(Font.custom("S-Core Dream", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    VStack {
                    ForEach(0..<choiceArr.count, id: \.self) { rowIndex in
                        HStack(spacing: 10) {
                            ForEach(choiceArr[rowIndex], id: \.self) { choice in
                                Button {
                                    keyword = choice
                                    progress += 1
                                } label: {
                                    if keyword == choice {
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
                .padding(.top, 30)
            }
            .offset(y: 200)
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
    }
}

struct CurationTestView3: View {
    @Binding var progress: Int
    @Binding var menu: String
    var body: some View {
        ZStack(alignment: .top) {
            Image("background_curationtest")
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 30) {
                Text("오늘 먹고 싶은\n메뉴를 골라주세요!")
                    .font(Font.custom("S-Core Dream", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)
                // 선택 안됨
                if menu == "none" {
                    VStack(spacing: -5) {
                        Button {
                            print( "coffee")
                            menu = "coffee"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater2(num: 1)
                        }
                        Button {
                            print( "drink")
                            menu = "drink"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater2(num: 2)
                        }
                        Button {
                            print( "dessert")
                            menu = "dessert"
                            progress += 1
                        } label: {
                            CurationTestButtonLabelCreater2(num: 3)
                        }
                    }
                } else {
                    VStack(spacing: -5) {
                        Button {
                            menu = "coffee"
                        } label: {
                            if menu == "coffee"{
                                CurationTestButtonLabelCreater2(num: 1)
                            } else {
                                CurationTestButtonLabelCreater2(num: 4)
                            }
                        }
                        Button {
                            menu = "drink"
                        } label: {
                            if menu == "drink"{
                                CurationTestButtonLabelCreater2(num: 2)
                            } else {
                                CurationTestButtonLabelCreater2(num: 5)
                            }
                        }
                        Button {
                            menu = "dessert"
                        } label: {
                            if menu == "dessert"{
                                CurationTestButtonLabelCreater2(num: 3)
                            } else {
                                CurationTestButtonLabelCreater2(num: 6)
                            }
                        }
                    }
                }
            }
            .offset(y: 200)
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
        }
    }
}
struct CurationTestView4: View {
    @Binding var atmosphare: String
    @Binding var gotoTest: Bool
    var body: some View {
        ZStack(alignment: .top) {
            Image("background_curationtest")
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 30) {
                Text("오늘 가고 싶은\n카페 분위기를 알려주세요!")
                    .font(Font.custom("S-Core Dream", size: 26))
                    .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
                    .padding(.leading, 14)
                // 선택 안됨
                if atmosphare == "none" {
                    HStack(spacing: -5) {
                        Button {
                            print( "quiet")
                            atmosphare = "quiet"
                           gotoTest = false
                        } label: {
                            CurationTestButtonLabelCreater3(num: 1)
                        }
                        Button {
                            print( "drink")
                            atmosphare = "drink"
                            gotoTest = false
                        } label: {
                            CurationTestButtonLabelCreater3(num: 2)
                                .padding(.vertical, 20)
                        }
                        Button {
                            print( "dessert")
                            atmosphare = "dessert"
                            gotoTest = false
                        } label: {
                            CurationTestButtonLabelCreater3(num: 3)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                } else {
                    HStack(spacing: -5) {
                        Button {
                            atmosphare = "coffee"
                        } label: {
                            if atmosphare == "coffee"{
                                CurationTestButtonLabelCreater3(num: 1)
                            } else {
                                CurationTestButtonLabelCreater3(num: 4)
                            }
                        }
                        Button {
                            atmosphare = "drink"
                        } label: {
                            if atmosphare == "drink"{
                                CurationTestButtonLabelCreater3(num: 2)
                            } else {
                                CurationTestButtonLabelCreater3(num: 5)
                            }
                        }
                        Button {
                            atmosphare = "dessert"
                        } label: {
                            if atmosphare == "dessert"{
                                CurationTestButtonLabelCreater3(num: 3)
                            } else {
                                CurationTestButtonLabelCreater3(num: 6)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                }
            }
            .offset(y: 200)
            .frame(width: UIScreen.main.bounds.width * 0.9,
                   alignment: .leading)
        }
    }
}
struct CUPV: PreviewProvider {
    static var previews: some View {
       // CurationBodyView(dataset: cuData)
        CurationMainView()
    }
}
