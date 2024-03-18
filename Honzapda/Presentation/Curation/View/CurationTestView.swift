import SwiftUI

struct CurationTestMainView: View {
    @ObservedObject var curationViewModel: CurationViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(curationViewModel: curationViewModel) // 헤더 부분 분리
            
            Group { // 프로그레스에 따른 뷰 변경
                switch curationViewModel.progress {
                case 0:
                    CurationTestView1(curationViewModel: curationViewModel)
                case 1:
                    CurationTestView2(curationViewModel: curationViewModel)
                case 2:
                    CurationTestView3(curationViewModel: curationViewModel)
                case 3:
                    CurationTestView4(curationViewModel: curationViewModel)
                default:
                    Text("Unknown progress")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 나머지 전체 영역을 차지하도록 설정
            .transition(.asymmetric(insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
            .animation(.default, value: curationViewModel.progress)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// 헤더 부분을 별도의 뷰로 분리
struct HeaderView: View {
    @ObservedObject var curationViewModel: CurationViewModel

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                curationViewModel.gotoTest = false
                print("backButton -> gotoCuration")
            }) {
                Image("button_curationtest_chevron.left")
                    .padding()
            } // 뒤로가기 버튼
            .frame(width: screenWidth, alignment: .leading)

            HStack(spacing: 0) { // 프로그레스 바
                Rectangle()
                    .frame(width: screenWidth * CGFloat(curationViewModel.progress) / 4, height: 2)
                    .foregroundColor(Color("Primary05")) // 프로그레스 바 색상
                
                Rectangle()
                    .frame(width: screenWidth * (1 - CGFloat(curationViewModel.progress) / 4), height: 2)
                    .foregroundColor(Color("Gray05")) // 남은 부분 색상
                Spacer()
            }
        }
        .frame(height: screenHeight * 0.1)
        .zIndex(1)
    }
}

struct CUPV: PreviewProvider {
    static var previews: some View {
        CurationTestMainView(curationViewModel: CurationViewModel())
    }
}
