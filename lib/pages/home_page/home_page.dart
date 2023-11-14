import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubit_states.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
import 'package:flutter_test_project/pages/home_page/widgets/homepage_place_recommended_play_list.dart';
import 'package:flutter_test_project/pages/home_page/widgets/homepage_title.dart';
import 'package:flutter_test_project/pages/home_page/widgets/homepage_environment_recommended_playlist.dart';
import 'package:flutter_test_project/pages/home_page/widgets/homepage_playback_history.dart';
import 'package:flutter_test_project/pages/home_page/widgets/homepage_emotion_recommended_playlist.dart';
import 'package:flutter_test_project/pages/home_page/widgets/homepage_user_custom_music_list.dart';
import 'package:flutter_test_project/pages/music_list_page/music_list_page.dart';
import 'package:flutter_test_project/pages/rank_page/rank_page_widgets/rank_page_category.dart';
import 'package:flutter_test_project/pages/rank_page/rank_page_widgets/rank_page_title_text.dart';
import 'package:flutter_test_project/widgets/app_our_bar.dart';
import 'package:flutter_test_project/widgets/background_concept_color.dart';
import 'package:flutter_test_project/widgets/sized_box_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController; // _tabController를 필드로 선언

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // initState에서 초기화
  }

  @override
  void dispose() {
    _tabController.dispose(); // _tabController를 dispose 메서드에서 해제
    super.dispose();
  }

  @override
  final List<String> images = [
    "jan_hon.jpeg",
    "jan_le.jpeg",
    "jan_monkey.jpeg",
    "jan_so.jpeg",
    "jan_so2.jpeg",
    "jan_monkey.jpeg",
    "jan_so.jpeg",
    "jan_hon.jpeg",
    "jan_le.jpeg",
    "jan_monkey.jpeg",
    "jan_so.jpeg",
    "jan_so2.jpeg",
    "jan_monkey.jpeg",
    "jan_so.jpeg",
  ];
  final List<String> titles = [
    "환상의나라",
    "전설",
    "몽키",
    "소곡집1",
    "소곡집2",
    "몽키",
    "소곡집2",
    "환상의나라",
    "전설",
    "몽키",
    "소곡집1",
    "소곡집2",
    "몽키",
    "소곡집2"
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: Stack(children: [
        BackgroundConceptColor(),
        CustomScrollView(slivers: <Widget>[
          OurAppBar(),
          SliverToBoxAdapter(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              height: 1350,
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<AppCubits, CubitStates>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    var info = state.places;

                    return SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // 페이지의 내용은 여기 있음
                        children: [
                          // "타이틀"(widget)
                          SizeBoxH40(),
                          HomePageMainTitle(text: "MUSIC 추천 리스트"),
                          SizeBoxH15(),

                          // 신곡 추천 리스트 나열 됨.
                          // TabBar
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                labelPadding:
                                    EdgeInsets.only(left: 15, right: 0),
                                controller: _tabController,
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.white60,
                                isScrollable: true,
                                indicatorSize: TabBarIndicatorSize.label,
                                labelStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                indicator: CircleTabIndicator(
                                    color: Colors.white, radius: 5),
                                tabs: [
                                  Tab(text: "PLACE"),
                                  Tab(text: "ENVIRONMENT"),
                                  Tab(text: "EMOTION"),
                                ],
                              ),
                            ),
                          ),
                          SizeBoxH15(),

                          // 추천 리스트를 담은 박스
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            height: 200,
                            width: double.maxFinite,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                // 장소 기반의 추천 리스트(widget)
                                PlaceRecommendedPlaylist(info: info),

                                // 상황 기반의 추천 리스트(widget)
                                EnvironmentRecommendedPlaylist(info: info),

                                // 감성 기반의 추천 리스트(widget)
                                EmotionRecommendedPlaylist(info: info)
                              ],
                            ),
                          ),
                          SizeBoxH40(),

                          // "내가 들은 노래 리스트"를 나열 해준다. (widget)
                          HomePageSubTitleAndIcon(text: '재생 목록'),
                          SizeBoxH25(),

                          // 재생되었던 목록을 만들었습니다.
                          PlayBackHistory(
                            info: info,
                            images: images,
                            titles: titles,
                          ),
                          SizeBoxH40(),

                          // "유저가 만든 리스트"를 나열해준다. (widget)
                          HomePageSubTitleAndIcon(text: "유저가 만든 리스트"),
                          SizeBoxH25(),
                          UserCustomMusicList(info: info),

                          SizeBoxH40(),
                          RankPageTitleText(
                            text: "분위기 및 장르",
                          ),
                          SizeBoxH20(),
                          CategoryList()
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}

// indicator를 디자인을 커스텀하기 위한 클래스를 선언했다. - 이찬용

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
