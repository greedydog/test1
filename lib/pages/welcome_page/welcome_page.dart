import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';
import 'package:flutter_test_project/widgets/app_text.dart';
import 'package:flutter_test_project/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['backimg44.png', 'backimg22.png', 'backimg11.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/" + images[index]),
                fit: BoxFit.cover,
              )),
              child: Container(
                margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "감성기반 음악추천"),
                        AppLargeText(text: "상황기반 음악추천", color: Colors.white),
                        AppLargeText(text: "장소기반 음악추천", color: Colors.white54),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "음악이 필요한 순간, 당신의 감정을 읽어드립니다! 취향 저격 플레이리스트로 하루를 업그레이드하세요. 지금 시작하면, 새로운 음악의 세계가 당신을 기다립니다.",
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                    width: 120,
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          width: 8,
                          // 웰컴 페이지 상단 오른쪽 위치표시 바 조건식으로, 현재 페이지의 속성에 따라 다른 모양이 나오게 하였다.
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              // 위치 표시의 테두리를 둥글게 만든다.
                              borderRadius: BorderRadius.circular(8),
                              // 현재 페이지가 아닌 페이지는 반투명으로 나오게 하였다.
                              color: index == indexDots
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
