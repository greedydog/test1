import 'package:flutter/material.dart';
import 'package:flutter_test_project/pages/music_play_page/widgets/music_play_page_slide_bar_list.dart';
import 'package:flutter_test_project/widgets/app_text.dart';
import 'package:flutter_test_project/widgets/pastel_color.dart';
import 'package:flutter_test_project/widgets/sized_box_widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MusicPlayPageSlideBottomBar extends StatefulWidget {
  final List<String> images;
  final List<String> title;
  final Color imageColor;
  const MusicPlayPageSlideBottomBar(
      {Key? key,
      required this.images,
      required this.title,
      required this.imageColor})
      : super(key: key);

  @override
  State<MusicPlayPageSlideBottomBar> createState() =>
      _MusicPlayPageSlideBottomBarState();
}

class _MusicPlayPageSlideBottomBarState
    extends State<MusicPlayPageSlideBottomBar> with TickerProviderStateMixin {
  late TabController _sidebartabController;

  @override
  void initState() {
    super.initState();
    _sidebartabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _sidebartabController.dispose(); // _tabController를 dispose 메서드에서 해제
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SlidingUpPanel(
        panel: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizeBoxH05(),
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(2)),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 10, right: 10),
                      controller: _sidebartabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      isScrollable: true,
                      indicatorColor: Colors.white,
                      indicatorWeight: 2.0,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Tab(text: "다음 트랙")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Tab(text: "가사")),
                      ],
                    ),
                  ),
                ),
                SizeBoxH20(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _sidebartabController,
                      children: [
                        SlideBarList(
                          images: widget.images,
                          title: widget.title,
                        ),
                        Center(
                            child: Column(
                          children: [
                            AppText(
                              text: '노래 가사가 들어갈 공간~',
                              size: 20,
                            ),
                            AppText(
                              text: '데이터 확인: ${widget.title[1]}',
                              size: 20,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // 슬라이딩 패널 핸들러가 위치할 공간
            ],
          ),
        ),
        color: makePastelTone(widget.imageColor),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        minHeight: 65,
        // 최소 패널 높이
        maxHeight: MediaQuery.of(context).size.height * 0.86, // 최대 패널 높이
      ),
    );
  }
}
