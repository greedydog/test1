import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';
import 'package:flutter_test_project/widgets/app_text.dart';

class RankPageTitleText extends StatelessWidget {
  final String text;

  const RankPageTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLargeText(
            text: text,
            color: Colors.white,
            size: 25,
          ),
          AppText(
            text: "더 보기",
            color: Colors.white70,
          )
        ],
      ),
    );
  }
}
