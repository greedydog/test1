import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubit_states.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
import 'package:flutter_test_project/pages/music_list_page/cubit/music_list_page_info_cubits.dart';
import 'package:flutter_test_project/widgets/app_buttons.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';
import 'package:flutter_test_project/widgets/app_text.dart';
import 'package:flutter_test_project/pages/music_play_page/widgets/music_play_buttons.dart';

// class DetailPage extends StatefulWidget {
//   const DetailPage({super.key});
//
//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   // 아래는 중요.
//   // 선택된 인덱스를 확인하기 위한 보조 변수
//   int selectedIndex = -1;
//   Color? color = Colors.black;
//
//   // 스크롤을 주기위한 코드입니다.
//   ScrollController _controller = ScrollController();
//
//   // 아래는 전부 테스트용.
//   String test = "";
//
//   // 이미지
//   List images = [
//     "jan_hon.jpeg",
//     "jan_le.jpeg",
//     "jan_monkey.jpeg",
//     "jan_so.jpeg",
//     "jan_so2.jpeg",
//     "jan_monkey.jpeg",
//     "jan_so.jpeg",
//     "jan_hon.jpeg",
//     "jan_le.jpeg",
//     "jan_monkey.jpeg",
//     "jan_so.jpeg",
//     "jan_so2.jpeg",
//     "jan_monkey.jpeg",
//     "jan_so.jpeg",
//   ];
//
//   // 노래제목
//   List title = [
//     "환상의나라",
//     "전설",
//     "몽키",
//     "소곡집1",
//     "소곡집2",
//     "몽키",
//     "소곡집2",
//     "환상의나라",
//     "전설",
//     "몽키",
//     "소곡집1",
//     "소곡집2",
//     "몽키",
//     "소곡집2"
//   ];
//
//   // 별갯수
//   int gottenStars = 4;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
//       // 정보를 가져오고 보내는 파이프(중요)
//       DetailState detail = state as DetailState;
//
//       var list = BlocProvider.of<MusicListPageInfoCubits>(context).state;
//       print('정보의 길이${list.length}');
//
//       for (int i = 0; i < list.length; i++) {
//         if (list[i].name == detail.place.name) {
//           selectedIndex = list[i].index!;
//
//           color = list[i].color;
//         }
//       }
//
//       return Scaffold(
//         body: Container(
//             width: double.maxFinite,
//             height: double.maxFinite,
//             child: Stack(
//               children: [
//                 // 상단의 이미지
//                 Positioned(
//                     left: 0,
//                     right: 0,
//                     child: ClipRRect(
//                       child: ImageFiltered(
//                         imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                         child: Container(
//                           width: double.maxFinite,
//                           height: MediaQuery.of(context).size.height,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/backimg1.jpeg"),
//                               fit: BoxFit.cover,
//                               colorFilter: ColorFilter.mode(
//                                 Colors.black.withOpacity(0.5), // 반투명한 검은색
//                                 BlendMode.overlay, // 오버레이 모드
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )),
//                 // 상단의 메뉴
//                 Positioned(
//                     width: MediaQuery.of(context).size.width - 20,
//                     left: 10,
//                     top: 70,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             BlocProvider.of<AppCubits>(context).goHome();
//                           },
//                           icon: Icon(
//                             Icons.west,
//                             size: 40,
//                           ),
//                           color: Colors.white,
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             BlocProvider.of<AppCubits>(context).goHome();
//                           },
//                           icon: Icon(
//                             Icons.search,
//                             size: 40,
//                           ),
//                           color: Colors.white,
//                         )
//                       ],
//                     )),
//                 // 하단의 출력 공간
//                 Positioned(
//                     top: 310,
//                     child: Container(
//                       padding: EdgeInsets.only(left: 20, top: 30, right: 20),
//                       width: MediaQuery.of(context).size.width,
//                       height: 700,
//                       decoration: BoxDecoration(
//                           color: Colors.black87,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30),
//                               topRight: Radius.circular(30))),
//                       child: Column(
//                         // 하단의 내용이 들어 있다.- 이찬용
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               AppLargeText(
//                                 text: "출근길 추천 노래",
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: [
//                               AppLargeText(
//                                 text: "데확용1 : " + detail.place.name,
//                                 color: Colors.white,
//                                 size: 20,
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           // 별 평점이 담긴 곳
//                           Row(
//                             children: [
//                               Wrap(
//                                 children: List.generate(5, (index) {
//                                   return Icon(
//                                     Icons.star,
//                                     color: index < gottenStars
//                                         ? Colors.orangeAccent
//                                         : Colors.grey,
//                                   );
//                                 }),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               AppText(
//                                 text: "(4.0)",
//                                 color: Colors.black87,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           // 노래 리스트가 담긴 곳
//                           Container(
//                             height: 240,
//                             width: double.maxFinite,
//                             child: ListView.builder(
//                                 controller: _controller,
//                                 padding: EdgeInsets.zero,
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: images.length,
//                                 itemBuilder: (_, index) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       var data = state.place;
//                                       var list = BlocProvider.of<
//                                               MusicListPageInfoCubits>(context)
//                                           .state;
//
//                                       for (int i = 0; i < list.length; i++) {
//                                         if (list[i].name == data.name) {
//                                           if (list[i].index == index) {
//                                             print('안녕 인덱스 ${selectedIndex}');
//                                           } else {
//                                             print('안녕 새로운 인덱스 $index');
//                                             BlocProvider.of<
//                                                         MusicListPageInfoCubits>(
//                                                     context)
//                                                 .updatePageInfo(
//                                                     detail.place.name,
//                                                     index,
//                                                     color);
//                                             selectedIndex = index;
//                                           }
//                                         }
//                                       }
//
//                                       if (selectedIndex == -1) {
//                                         // 이 버튼, 즉 앨범을 누를 떄, 정보가 넘어갑니다. 이것은요, 이 페이지 안에서 체크 되는 것을 저장하기 위한 것입니다.
//                                         BlocProvider.of<
//                                                     MusicListPageInfoCubits>(
//                                                 context)
//                                             .addPageInfo(detail.place.name,
//                                                 index, color);
//                                       }
//
//                                       setState(() {
//                                         selectedIndex = index;
//                                       });
//
//                                       // 음악을 누르면 스크롤이 거기로 이동함. 아시죠?
//                                       _controller.animateTo(index * 60.0,
//                                           duration: Duration(milliseconds: 200),
//                                           curve: Curves.easeInOut);
//                                     },
//                                     child: Container(
//                                       margin: const EdgeInsets.only(bottom: 5),
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                             width: 55,
//                                             height: 55,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                                 color: Colors.white,
//                                                 image: DecorationImage(
//                                                     image: AssetImage(
//                                                         "assets/" +
//                                                             images[index]),
//                                                     fit: BoxFit.cover)),
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           // 여기에 노래의 가수 이름과 노래 제목이 들어갑니다. -이찬용
//                                           Expanded(
//                                             child: Container(
//                                               // width: 290,
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Container(
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         AppText(
//                                                           text: title[index]
//                                                               .toString(),
//                                                           color: Colors.white,
//                                                           size: 16,
//                                                         ),
//                                                         AppText(
//                                                           text: "잔나비",
//                                                           color: Colors.grey,
//                                                           size: 15,
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     child: Icon(
//                                                       Icons.more_vert_sharp,
//                                                       color: Colors.white,
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           )
//                         ],
//                       ),
//                     )),
//                 // 하단의 메뉴
//                 Positioned(
//                     bottom: 80,
//                     left: 20,
//                     right: 20,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             var list = BlocProvider.of<MusicListPageInfoCubits>(
//                                     context)
//                                 .state;
//                             // 우선 이게 문제인 것은 찾았음, 나중에 분석해보자. 현제 페이지에서 리스트를 클릭하지 않으면 상태를 파악하지 못하는 것이 문제의 원인
//
//                             if (list.isEmpty) {
//                               setState(() {
//                                 color = Colors.red;
//                               });
//
//                               BlocProvider.of<MusicListPageInfoCubits>(context)
//                                   .updatePageWish(
//                                       detail.place.name, selectedIndex, color);
//                             } else {
//                               for (int i = 0; i < list.length; i++) {
//                                 if (list[i].name == detail.place.name) {
//                                   if (list[i].color == Colors.red) {
//                                     Future.delayed(Duration.zero, () {
//                                       BlocProvider.of<MusicListPageInfoCubits>(
//                                               context)
//                                           .updatePageWish(detail.place.name,
//                                               selectedIndex, color);
//                                     });
//                                     setState(() {
//                                       color = Colors.black;
//                                     });
//                                     return;
//                                   } else if (color == Colors.black) {
//                                     setState(() {
//                                       color = Colors.red;
//                                     });
//                                     BlocProvider.of<MusicListPageInfoCubits>(
//                                             context)
//                                         .updatePageWish(detail.place.name,
//                                             selectedIndex, color);
//                                     return;
//                                   }
//                                 } else {
//                                   if (color == Colors.black) {
//                                     setState(() {
//                                       color = Colors.red;
//                                     });
//                                     BlocProvider.of<MusicListPageInfoCubits>(
//                                             context)
//                                         .updatePageWish(detail.place.name,
//                                             selectedIndex, color);
//                                   } else {
//                                     setState(() {
//                                       color = Colors.black;
//                                     });
//                                     BlocProvider.of<MusicListPageInfoCubits>(
//                                             context)
//                                         .updatePageWish(detail.place.name,
//                                             selectedIndex, color);
//                                   }
//                                 }
//                               }
//                             }
//                           },
//                           child: AppButtons(
//                               isIcon: true,
//                               icon: Icons.add,
//                               size: 60,
//                               color: color!,
//                               backgraundColor: Colors.white,
//                               borderColor: color!),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         MusicPlayButton(
//                           icon: Icons.skip_previous,
//                           iconColor: Colors.white,
//                           iconSize: 40,
//                         ),
//                         MusicPlayButton(
//                           icon: Icons.play_arrow,
//                           iconColor: Colors.white,
//                           iconSize: 40,
//                         ),
//                         MusicPlayButton(
//                           icon: Icons.skip_next,
//                           iconColor: Colors.white,
//                           iconSize: 40,
//                         ),
//                         MusicPlayButton(
//                           icon: Icons.replay,
//                           iconColor: Colors.white,
//                           iconSize: 40,
//                         )
//                       ],
//                     )),
//                 // 리스트, 뷰, 자켓 앨범.
//                 Positioned(
//                     top: 130,
//                     left: MediaQuery.of(context).size.width / 2 - 100,
//                     child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black54.withOpacity(0.5),
//                               spreadRadius: 3,
//                               blurRadius: 15,
//                               offset:
//                                   Offset(0, 0), // changes position of shadow
//                             ),
//                           ],
//                         ),
//                         child: GridView.count(
//                           padding: EdgeInsets.zero,
//                           crossAxisCount: 2,
//                           childAspectRatio: 1 / 1,
//                           children: List.generate(4, (index) {
//                             return Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: MediaQuery.of(context).size.height,
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image:
//                                           AssetImage('assets/' + images[index]),
//                                       fit: BoxFit.cover)),
//                             );
//                           }),
//                         ))),
//               ],
//             )),
//       );
//     });
//   }
// }
