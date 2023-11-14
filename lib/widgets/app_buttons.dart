import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgraundColor;
  String? text;
  IconData? icon;
  double size;
  final Color borderColor;
  bool? isIcon;

   AppButtons({super.key, this.isIcon = false, this.text = "내용", this.icon, required this.size, required this.color, required this.backgraundColor, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
        border: Border.all(color: borderColor,width: 1.0),
        borderRadius: BorderRadius.circular(10),
    color: backgraundColor),
      child: isIcon == false?Center(child: AppText(text: text!,color: color, )):Center(child: Icon(icon, color: color,)),
    );
  }
}
