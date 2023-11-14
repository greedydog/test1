import 'dart:ui';

import 'package:flutter/material.dart';

class MusicListBackground extends StatelessWidget {
  const MusicListBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        child: ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backimg1.jpeg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), // 반투명한 검은색
                    BlendMode.overlay, // 오버레이 모드
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
