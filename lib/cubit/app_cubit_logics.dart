import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubit_states.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
import 'package:flutter_test_project/pages/music_play_page/music_play_page.dart';
import 'package:flutter_test_project/pages/main_page/main_page.dart';
import 'package:flutter_test_project/pages/my_info_Page/my_info_page.dart';
import 'package:flutter_test_project/pages/rank_page/rank_page.dart';
import 'package:flutter_test_project/pages/video_page/video_page.dart';
import 'package:flutter_test_project/pages/welcome_page/welcome_page.dart';
import 'package:flutter_test_project/widgets/loding_animation.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is RankPageState) {
            return RankPage();
          }
          if (state is SearchPageState) {
            return VideoPage();
          }
          if (state is MyPageState) {
            return MyPage();
          }
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is LoadingState) {
            return Center(
              child: LodingAnimation(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
