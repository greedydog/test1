import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubit_states.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
import 'package:flutter_test_project/pages/my_info_Page/my_info_widgets/my_info_list_icon_style.dart';
import 'package:flutter_test_project/pages/my_info_Page/my_info_widgets/my_info_list_text_style.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';
import 'package:flutter_test_project/widgets/app_our_bar.dart';
import 'package:flutter_test_project/widgets/app_text.dart';
import 'package:flutter_test_project/widgets/background_concept_color.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool listStayle = true;
  IconData iconChainge = Icons.list;

  @override
  Widget build(BuildContext context) {
    List<int> randomNum1or2List() {
      var random = Random();
      List<int> randomNumberlist =
          List<int>.generate(10, (index) => random.nextInt(2) + 1);
      return randomNumberlist;
    }

    final List<int> randomNumberlist = randomNum1or2List();

    final List<String> sing = [
      "11.jpeg",
      "22.jpeg",
      "33.jpeg",
      "44.jpeg",
      "55.jpeg",
      "66.png",
      "77.jpeg",
      "88.jpeg"
    ];
    final List<String> song = [
      "11.jpeg",
      "22.jpeg",
      "33.jpeg",
      "44.jpeg",
      "55.jpeg",
      "66.jpeg",
      "77.jpeg",
      "88.png"
    ];

    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: Stack(children: [
        BackgroundConceptColor(),
        CustomScrollView(slivers: <Widget>[
          OurAppBar(),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<AppCubits, CubitStates>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    var info = state.places;

                    return Column(
                      children: [
                        // 환영 타이틀.
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: "###님 환영합니다.",
                                color: Colors.white,
                                size: 22,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),

                        // 최근활동 버튼
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: "최근 활동",
                                color: Colors.white,
                                size: 24,
                              ),
                              IconButton(
                                icon: Icon(
                                  iconChainge,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (listStayle) {
                                    iconChainge = Icons.grid_view;
                                  } else {
                                    iconChainge = Icons.list;
                                  }

                                  setState(() {
                                    listStayle = !listStayle;
                                  });
                                },
                              )
                            ],
                          ),
                        ),

                        // 마이 리스트 정렬
                        SizedBox(
                          height: 30,
                        ),

                        listStayle == false
                            ? myInfoListTextStyle(
                                song: song,
                                sing: sing,
                                randomNumberlist: randomNumberlist,
                                info: info,
                              )
                            : MyInfoListIconStyle(
                                sing: sing,
                                song: song,
                                randomNumberlist: randomNumberlist,
                                info: info),
                      ],
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
