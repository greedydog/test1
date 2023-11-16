import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubit_states.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
import 'package:flutter_test_project/models/test_model.dart';
import 'package:flutter_test_project/pages/music_play_page/audio_file.dart';
import 'package:flutter_test_project/pages/music_play_page/widgets/music_play_page_background.dart';
import 'package:flutter_test_project/pages/music_play_page/widgets/music_play_page_slide_bottom_bar.dart';
import 'package:flutter_test_project/pages/music_play_page/widgets/music_play_page_top_menu.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';

import 'package:flutter_test_project/widgets/pastel_color.dart';
import 'package:flutter_test_project/widgets/sized_box_widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayPage extends StatefulWidget {
  final TestModel info;
  const MusicPlayPage({super.key, required this.info});
//이 페이지의 상태 관리
  @override
  State<MusicPlayPage> createState() => _MusicPlayPageState();
}
//오디오 플레이어 init
final musicPlayer = AudioPlayer();

class _MusicPlayPageState extends State<MusicPlayPage> {
  late PageController _musicpagecontroller;

  @override
  void initState() {
    super.initState();
    _musicpagecontroller = PageController();
  }

  @override
  void dispose() {
    _musicpagecontroller.dispose(); // _tabController를 dispose 메서드에서 해제
    super.dispose();
  }

  Color averageColor = Color(0xffae242c);

  int gottenStars = 4;
  int selectedIndex = -1;

  // 재생 아이콘 상태를 위한 코드 (재생 => 일시정지)
  IconData playIcon = Icons.play_arrow;

  List menu = ["좋아요 | 싫어요", "추가하기", "공유", "평가하기", "가수 정보", "앨범 정보"];

  List<String> images = [
    "jan_hon.jpeg",
    "jan_le.jpeg",
    "jan_monkey.jpeg",
    "jan_so.jpeg",
    "jan_so2.jpeg",
    "jan_monkey.jpeg",
    "jan_so.jpeg",
  ];

  List<String> title = ["환상의나라", "전설", "몽키", "소곡집1", "소곡집2", "몽키", "소곡집2"];

  @override
  Widget build(BuildContext context) {
    // MusicPlayState musicplay = state as MusicPlayState;

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // 전체 배경 이미지 (widget)
            // MusicPlayPageBackground(
            //   images: images,
            //   musicpagecontroller: _musicpagecontroller,
            // ),
            // // 상단의 메뉴(뒤로가기, 앞으로 가기.)
            // MusicPlayPageTopMenu(),
            // 하단의 출력 공간
            // Positioned(
            //     top: 420,
            //     child: Container(
            //       padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
            //       width: MediaQuery.of(context).size.width,
            //       height: 600,
            //       decoration: BoxDecoration(
            //           // color: Colors.white10,
            //           gradient: LinearGradient(
            //             begin: Alignment.topCenter,
            //             end: Alignment.bottomCenter,
            //             colors: [Colors.transparent, Colors.black54],
            //           ),
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(10),
            //               topRight: Radius.circular(10))),
            //       child: Column(
            //         // 하단의 내용이 들어 있다.- 이찬용
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               AppLargeText(
            //                 text: "환상의 나라",
            //                 color: Colors.white70,
            //                 size: 26,
            //               ),
            //             ],
            //           ),
            //           SizeBoxH05(),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               AppLargeText(
            //                 text: "잔나비",
            //                 color: Colors.white70,
            //                 size: 20,
            //               )
            //             ],
            //           ),
            //           SizeBoxH20(),
            //         ],
            //       ),
            //     )),
            // 하단의 메뉴( 좋아요, 싫어요, 마이 리스트 추가 하기, 공유 하기, 리플 /재생 되는 바 /셔플, 뒤로 가기, 재생, 앞으로 가기, 다시 듣기)
            Positioned(
                bottom: 75,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    // Container(
                    //   height: 80,
                    //   width: double.maxFinite,
                    //   child: ShaderMask(
                    //     shaderCallback: (Rect bounds) {
                    //       return LinearGradient(
                    //         begin: Alignment.centerLeft,
                    //         end: Alignment.centerRight,
                    //         colors: [
                    //           Colors.transparent,
                    //           Colors.black,
                    //           Colors.black,
                    //           Colors.transparent
                    //         ],
                    //         stops: [0.0, 0.02, 0.97, 01.0], // 흐림 효과의 범위를 조절합니다.
                    //       ).createShader(bounds);
                    //     },
                    //     blendMode: BlendMode.dstIn, // 흐림 효과를 적용하기 위한 블렌드 모드
                    //     child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: menu.length,
                    //       itemBuilder: (_, index) {
                    //         return Container(
                    //           child: Row(
                    //             children: [
                    //               SizedBox(width: 5),
                    //               Container(
                    //                 padding: const EdgeInsets.all(10),
                    //                 height: 45,
                    //                 child: Text(menu[index],
                    //                     style: TextStyle(
                    //                         fontSize: 18, color: Colors.white)),
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.black26,
                    //                   borderRadius: BorderRadius.circular(20),
                    //                 ),
                    //               ),
                    //               SizedBox(width: 5),
                    //             ],
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // 음악 플레이어에 영향을 주는 함수 2
                    // AudioDrive(musicPlayer),
                  ],
                )),
            Container(
              child:
                   AudioDrive(musicPlayer)
            ),
            // 앨범자켓 (현재 재생되는 앨범자켓이 출력되는 장소입니다)
            // Positioned(
            //   top: 110,
            //   left: 0,
            //   child: Container(
            //     height: MediaQuery.of(context).size.width,
            //     width: MediaQuery.of(context).size.width,
            //     child: PageView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: images.length,
            //         onPageChanged: (index) async {
            //           _musicpagecontroller
            //               .jumpToPage(index); // 첫 번째 PageView와 동기화
            //
            //           final ImageProvider imageProvider = AssetImage(
            //               "assets/" + images[index]); // 현재 페이지의 이미지를 가져오는 코드
            //
            //           // PaletteGenerator를 이용하여 이미지 분석
            //           try {
            //             final PaletteGenerator paletteGenerator =
            //                 await PaletteGenerator.fromImageProvider(
            //               imageProvider,
            //               size:
            //                   Size(200, 100), // 예시 크기입니다. 실제 이미지 크기에 맞게 조정해주세요.
            //             );
            //
            //             // 추출한 색상으로 UI 업데이트
            //             setState(() {
            //               // 이곳에서 paletteGenerator의 색상을 사용할 수 있습니다.
            //               averageColor = paletteGenerator.dominantColor!.color;
            //               print(averageColor.toString());
            //               // 이 값을 위젯의 상태에 저장하여 UI에 적용합니다.
            //             });
            //           } catch (e) {
            //             // 오류 처리
            //             print('색상을 추출하는데 실패했습니다: $e');
            //           }
            //         },
            //         itemBuilder: (_, index) {
            //           return GestureDetector(
            //             child: Container(
            //               padding: EdgeInsets.only(left: 40, right: 40),
            //               child: Row(
            //                 children: [
            //                   Container(
            //                     width: MediaQuery.of(context).size.width - 80,
            //                     height: MediaQuery.of(context).size.width - 80,
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(5),
            //                         boxShadow: [
            //                           BoxShadow(
            //                             color: Colors.black54.withOpacity(0.5),
            //                             spreadRadius: 3,
            //                             blurRadius: 15,
            //                             offset: Offset(
            //                                 0, 0), // changes position of shadow
            //                           ),
            //                         ],
            //                         color: Colors.white,
            //                         image: DecorationImage(
            //                             image: AssetImage(
            //                                 "assets/" + images[index]),
            //                             fit: BoxFit.cover)),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         }),
            //   ),
            // ),
            // 하단 슬라이더 바 가사, 재새중 목록(widget)

            // 이것이 음악플레이어의 슬라이더에 영향이 있는지는 모름
            MusicPlayPageSlideBottomBar(
                images: images, title: title, imageColor: averageColor),
          ],
        ),
      ),
    );
  }
}
