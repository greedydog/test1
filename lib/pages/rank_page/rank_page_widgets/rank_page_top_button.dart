import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// 랭크 페이지의 상단에 있는 3 개의 버튼입니다.
class RankPageTopButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const RankPageTopButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.all(5),
      padding:EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color:Colors.grey[900],
          borderRadius: BorderRadius.circular(7)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,size: 30,color: Colors.white,),
          SizedBox(height: 5,),
          Text(text,style:TextStyle(fontSize: 17, color: Colors.white),)
        ],
      ),
    );
  }
}

