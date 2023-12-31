import 'dart:ui';

import 'package:flutter/material.dart';

class MusicListArtistBackground extends StatelessWidget {
  const MusicListArtistBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: ClipRRect(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/all/11.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), // 반투명한 검은색
                BlendMode.overlay, // 오버레이 모드
              ),
            ),
          ),
        ),
      ),
    );
  }
}
