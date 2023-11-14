import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/test_model.dart';
import 'package:flutter_test_project/pages/music_list_page/music_list_page.dart';
import 'package:flutter_test_project/pages/music_play_page/music_play_page.dart';
import 'package:flutter_test_project/pages/rank_page/rank_page.dart';
import 'package:flutter_test_project/pages/home_page/home_page.dart';
import 'package:flutter_test_project/pages/my_info_Page/my_info_page.dart';
import 'package:flutter_test_project/pages/video_page/video_page.dart';
import 'package:flutter_test_project/widgets/global_keys.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   List pages = [
//     HomePage(),
//     BarItemPage(),
//     SearchPage(),
//     MyPage(),
//   ];
//
//   int currentIndex = 0;
//
//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         unselectedFontSize: 0,
//         selectedFontSize: 0,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.transparent,
//         onTap: onTap,
//         currentIndex: currentIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey.withOpacity(0.5),
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//         elevation: 0,
//         items: [
//           BottomNavigationBarItem(
//               label: "Home", icon: Icon(Icons.home_filled, size: 35)),
//           BottomNavigationBarItem(
//               label: "Bar", icon: Icon(Icons.bar_chart_sharp, size: 35)),
//           BottomNavigationBarItem(
//               label: "Search", icon: Icon(Icons.subscriptions, size: 35)),
//           BottomNavigationBarItem(
//               label: "My", icon: Icon(Icons.library_music, size: 35)),
//         ],
//       ),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    RankPage(),
    VideoPage(),
    MyPage(),
  ];

  void onTap(int index) {
    if (index == currentIndex) {
      navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 35),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final currentNavigator = navigatorKeys[currentIndex].currentState;
        if (currentNavigator!.canPop()) {
          currentNavigator.pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: IndexedStack(
          index: currentIndex,
          children: pages
              .map((page) => Navigator(
                    key: navigatorKeys[pages.indexOf(page)],
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (_) => page),
                  ))
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black.withOpacity(0.9),
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: [
            _buildNavItem(Icons.home_filled, "Home"),
            _buildNavItem(Icons.bar_chart_sharp, "Rank"),
            _buildNavItem(Icons.subscriptions, "Search"),
            _buildNavItem(Icons.library_music, "My"),
          ],
        ),
      ),
    );
  }
}
