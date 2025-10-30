/*
  날짜 : 2025/10/30
  이름 : 이수연
  내용 : 쇼핑몰앱 만들기

  - 10.30 : 메인 화면 구현
*/


import 'package:flutter/material.dart';
import 'package:kmark_shopping_app/screen/main/main_tab_screen.dart';
import 'package:kmark_shopping_app/screen/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      //home: MainTabScreen(),
    );
  }

}