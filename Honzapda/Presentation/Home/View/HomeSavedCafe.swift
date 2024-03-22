////
////  HomeSavedCafe.swift
////  Honzapda
////
////  Created by 이재용 on 3/2/24.
////
//
//// 바텀시트
//
//import SwiftUI
//
//struct HomeBottomSheetView: View {
//  let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    @ObservedObject var homeViewModel: HomeViewModel
//  var body: some View {
//      ZStack(alignment: .top) {
//          Image("bottomSheetBackground")
//              .resizable() // 이미지 크기 조정 가능하도록 설정
//              .aspectRatio(contentMode: .fill) // 이미지를 프레임에 꽉 차게 채움
//              .clipped() // 프레임을 넘어서는 부분을 잘라냄
//          VStack {
//              HStack {
//                  Rectangle()
//                      .foregroundColor(Color("Gray04"))
//                      .frame(width: 100, height: 3)
//                      .padding(.top, 10)
//              }
//              HStack {
//                  Text("내가 저장한 카페")
//                  .font(Font.custom("S-Core Dream", size: 20))
//                  .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.64))
//                  Spacer()
//              }.padding(.leading, 24)
//                  .padding(.vertical)
//             ScrollView {
//                  LazyVGrid(columns: columns) {
//                      ForEach(homeViewModel.savedCafeModel.savedCafeList) { data in
//                        ZStack {
//                            AsyncImage(url: URL(string: data.photoUrl)) { image in
//                                       image.resizable()
//                                   } placeholder: {
//                                       Image("CafeSampleIMG") // 이미지가 로드되는 동안 표시될 뷰
//                                   }
//                                   .scaledToFill()
//                                   .frame(width: 165, height: 150)
//                                   .clipped()
//                            VStack {
//                                HStack {
//                                    Text(data.place_name)
//                                        .font(Font.custom("S-Core Dream", size: 12))
//                                        .foregroundColor(.white)
//                                    Spacer()
//                                }
//                                HStack {
//                                    Text(data.address + data.address_spec)
//                                        .font(Font.custom("S-Core Dream", size: 6))
//                                        .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
//                                    Spacer()
//                                }
//                            }
//                            .padding(.leading)
//                            .offset(y: 40)
//                        }
//                        .frame(width: 165, height: 150)
//                            .cornerRadius(15)
//                    }
//                  }
//                  .padding()
//              }
//             .frame(width: UIScreen.main.bounds.width,
//                    height: UIScreen.main.bounds.height * 0.5,
//                    alignment: .center)
//          }
//      }
//      .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
//  }
//}
//
//struct Bottomsheet_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeBottomSheetView(homeViewModel: HomeViewModel())
//    }
//}
