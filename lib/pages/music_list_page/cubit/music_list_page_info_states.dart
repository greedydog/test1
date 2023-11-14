// import 'dart:ui';
import 'package:flutter/material.dart';

class MusicListPageInfoState{
  final int? index;
  final String? name;
  final  Color? color;
  const MusicListPageInfoState({this.index, this.name, this.color = Colors.black});
}

// MusicListPageInfoState 의 역할은 음악 정보를 담는 "데이터 구조"와 "모델"을 제공합니다.