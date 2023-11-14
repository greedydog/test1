import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/pastel_color.dart';

class MusicPlayPageBackground extends StatefulWidget {
  final List<String> images;
  final PageController musicpagecontroller;
  const MusicPlayPageBackground(
      {super.key, required this.images, required this.musicpagecontroller});

  @override
  State<MusicPlayPageBackground> createState() =>
      _MusicPlayPageBackgroundState();
}

class _MusicPlayPageBackgroundState extends State<MusicPlayPageBackground> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        child: ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.images.length,
                  controller: widget.musicpagecontroller,
                  onPageChanged: (index) {
                    widget.musicpagecontroller
                        .jumpToPage(index); // 첫 번째 PageView와 동기화
                  },
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/" + widget.images[index]),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}
