import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/app_large_text.dart';
import 'package:flutter_test_project/widgets/app_text.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.amber,
      Colors.teal,
      Colors.lime,
      Colors.indigo,
      Colors.pink,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.grey,
      Colors.blueGrey,
    ];

    List<String> musicGenresAndMoods = [
      "팝",
      "록",
      "재즈",
      "클래식",
      "힙합",
      "R&B",
      "블루스",
      "컨트리",
      "일렉트로닉",
      "포크",
      "레게",
      "메탈",
      "펑크",
      "라틴",
      "소울",
    ];

    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 190, // 전체 그리드 뷰의 높이 설정
      child: GridView.builder(
        scrollDirection: Axis.horizontal, // 수평 스크롤 설정
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3행
          crossAxisSpacing: 15, // 가로 간격
          mainAxisSpacing: 15, // 세로 간격
          childAspectRatio: 1 / 3.38, // 아이템의 가로세로 비율
        ),
        itemCount: 15, // 총 18개 아이템 (6열 * 3행)
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 8,
                  decoration: BoxDecoration(
                      color: colorList[index],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                ),
                SizedBox(
                  width: 15,
                ),
                AppLargeText(
                  text: musicGenresAndMoods[index],
                  size: 19,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
