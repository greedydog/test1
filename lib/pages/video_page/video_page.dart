// import 'package:flutter/material.dart';
// import 'package:flutter_test_project/widgets/background_concept_color.dart';
// import '../../widgets/app_our_bar.dart';
//
// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.grey[900],
//       body: Stack(children: [
//         BackgroundConceptColor(),
//         CustomScrollView(slivers: <Widget>[OurAppBar(), SliverToBoxAdapter()]),
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/background_concept_color.dart';
import 'package:flutter_test_project/widgets/neu_box.dart';
import '../../widgets/app_our_bar.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundConceptColor(),
          CustomScrollView(
            slivers: <Widget>[
              OurAppBar(),
              SliverToBoxAdapter(
                child: Container(
                  height: 200, // 전체 그리드 뷰의 높이 설정
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal, // 수평 스크롤 설정
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3행
                      crossAxisSpacing: 15, // 가로 간격
                      mainAxisSpacing: 15, // 세로 간격
                      childAspectRatio: 1 / 3.2, // 아이템의 가로세로 비율
                    ),
                    itemCount: 18, // 총 18개 아이템 (6열 * 3행)
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5))),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // 나머지 내용 추가
              )
            ],
          ),
        ],
      ),
    );
  }
}
