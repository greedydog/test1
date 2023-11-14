// import 'package:flutter/material.dart';
// import 'package:flutter_test_project/widgets/app_text.dart';
//
// class RankPageRankList extends StatelessWidget {
//   final List<String> title;
//   final List<String> images;
//
//   const RankPageRankList(
//       {super.key, required this.images, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 15, right: 15),
//       height: 350,
//       width: double.maxFinite,
//       child: ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.zero,
//           scrollDirection: Axis.vertical,
//           itemCount: 5,
//           itemBuilder: (_, index) {
//             return GestureDetector(
//               onTap: () {},
//               child: Container(
//                 margin: const EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   children: [
//                     // 순위가 들어갑니다.
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Container(
//                       width: 40,
//                       height: 60,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             Text(
//                               '${index + 1}',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 30),
//                             ),
//                             Icon(
//                               Icons.trending_up,
//                               color: Colors.red,
//                               size: 17,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//
//                     // 앨범 자켓이 들어갑니다.
//                     Container(
//                       width: 60,
//                       height: 60,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                           image: DecorationImage(
//                               image: AssetImage("assets/" + images[index]),
//                               fit: BoxFit.cover)),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     // 가수이름, 노래 제목, 아이콘이 들어갑니다.
//                     Expanded(
//                       child: Container(
//                         // width: 290,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: title[index].toString(),
//                                     color: Colors.white,
//                                     size: 16,
//                                   ),
//                                   AppText(
//                                     text: "잔나비",
//                                     color: Colors.grey,
//                                     size: 15,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Icon(
//                                 Icons.more_vert_sharp,
//                                 color: Colors.white,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
import 'package:flutter_test_project/models/test_model.dart';
import 'package:flutter_test_project/pages/music_play_page/music_play_page.dart';
import 'package:flutter_test_project/widgets/app_text.dart';
import 'package:flutter_test_project/widgets/global_keys.dart';

class RankPageRankList extends StatelessWidget {
  final List<String> titles;
  final List<String> images;
  final List<TestModel> info;

  const RankPageRankList(
      {super.key,
      required this.images,
      required this.titles,
      required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 350,
      width: double.maxFinite,
      child: PageView(
        children: [
          _buildRankList(context, 0, 5), // 1-4위
          _buildRankList(context, 5, 10), // 5-8위
        ],
      ),
    );
  }

  Widget _buildRankList(BuildContext context, int start, int end) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: end - start,
      itemBuilder: (_, index) {
        int rankIndex = start + index;
        return InkWell(
          onTap: () {
            // BlocProvider.of<AppCubits>(context).MusicPlayPage(info[index]);
            mainNavigatorKey.currentState!.push(
              MaterialPageRoute(
                  builder: (context) => MusicPlayPage(info: info[index])),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                SizedBox(width: 5),
                Container(
                  width: 40,
                  height: 60,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '${rankIndex + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Icon(
                          Icons.trending_up,
                          color: Colors.red,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/" + images[rankIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: titles[rankIndex],
                            color: Colors.white,
                            size: 16,
                          ),
                          AppText(
                            text: "잔나비",
                            color: Colors.grey,
                            size: 15,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_vert_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
