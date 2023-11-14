import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';
import 'package:flutter_test_project/widgets/app_text.dart';

// 메인의 메인 타이틀(뮤직 추천 리스트)
class HomePageMainTitle extends StatelessWidget {
  final String text;
  const HomePageMainTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: AppLargeText(
        text: text,
        color: Colors.white,
      ),
    );
  }
}

// 메인에 서브타이틀들, (재생목록, 유저가 만든 리스트등)
class HomePageSubTitleAndIcon extends StatelessWidget {
  final String text;
  const HomePageSubTitleAndIcon({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLargeText(
            text: text,
            color: Colors.white70,
            size: 22,
          ),
          AppText(
            text: "모두 보기",
            color: Colors.white70,
          )
        ],
      ),
    );
  }
}
