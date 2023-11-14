import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';
import 'package:flutter_test_project/widgets/sized_box_widgets.dart';

class SongTitleSingerName extends StatefulWidget {
  const SongTitleSingerName({super.key});

  @override
  State<SongTitleSingerName> createState() => _SongTitleSingerNameState();
}

class _SongTitleSingerNameState extends State<SongTitleSingerName> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 420,
        child: Container(
          padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
          width: MediaQuery.of(context).size.width,
          height: 600,
          decoration: BoxDecoration(
              // color: Colors.white10,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black26, Colors.black12],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            // 하단의 내용이 들어 있다.- 이찬용
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLargeText(
                    text: "환상의 나라",
                    color: Colors.white70,
                    size: 26,
                  ),
                ],
              ),
              SizeBoxH05(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLargeText(
                    text: "잔나비",
                    color: Colors.white70,
                    size: 20,
                  )
                ],
              ),
              SizeBoxH20(),
            ],
          ),
        ));
  }
}
