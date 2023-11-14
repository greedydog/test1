import 'package:flutter/material.dart';

class BackgroundConceptColor extends StatelessWidget {
  const BackgroundConceptColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black
      ],
      stops: [0.0, 0.3, 0.5, 0.7, 1.0],
    )));
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(home: BackgroundConceptColor()));
// }
//
// class BackgroundConceptColor extends StatefulWidget {
//   const BackgroundConceptColor({Key? key}) : super(key: key);
//
//   @override
//   _BackgroundConceptColorState createState() => _BackgroundConceptColorState();
// }
//
// class _BackgroundConceptColorState extends State<BackgroundConceptColor>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   late Animation<double> _widthAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 750), // 비트 속도에 맞춰 조절 가능
//       vsync: this,
//     );
//
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//
//     _widthAnimation = Tween<double>(begin: 0.01, end: 0.05) // 그라데이션 너비의 시작과 끝
//         .animate(_animation)
//       ..addListener(() {
//         setState(() {});
//       });
//
//     _controller.repeat(reverse: true); // 비트처럼 반복
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // 그라데이션의 stops를 애니메이션 값에 따라 조정
//     double width = _widthAnimation.value;
//     final stops = [0.0, 1.0 - width, 1.0, 1.0 + width, 1.0];
//
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.black,
//               Colors.black,
//               Colors.purple,
//               Colors.black,
//               Colors.black,
//             ],
//             stops: stops,
//           ),
//         ),
//       ),
//     );
//   }
// }
