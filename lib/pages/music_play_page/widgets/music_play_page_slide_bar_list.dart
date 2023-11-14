import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/app_text.dart';

class SlideBarList extends StatefulWidget {
  final List<String> images;
  final List<String> title;
  const SlideBarList({super.key, required this.title, required this.images});

  @override
  State<SlideBarList> createState() => _SlideBarListState();
}

class _SlideBarListState extends State<SlideBarList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.maxFinite,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: widget.images.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(bottom: 5, top: 5),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/" + widget.images[index]),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    // 여기에 노래의 가수 이름과 노래 제목이 들어갑니다. -이찬용
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: widget.title[index].toString(),
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  AppText(
                                    text: "잔나비",
                                    color: Colors.white70,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
