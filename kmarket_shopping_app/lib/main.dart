/*
  날짜 : 2025/10/30
  이름 : 이수연
  내용 : 쇼핑몰앱 만들기

  - 10.30 : 메인 화면 구현
*/


import 'package:flutter/material.dart';
import 'package:kmarket_shopping_app/providers/auth_provider.dart';
import 'package:kmarket_shopping_app/screens/main/main_tab_screen.dart';
import 'package:kmarket_shopping_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {

  //runApp(const MyApp());

  runApp(

    // (Provider 의존성 추가-pubspen.yaml에 provider: ^6.1.5 추가)

    // 최소 앱을 실행할 때 AuthProvider로 로그인 여부 체크
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()), // 생성자에서 로그인여부 검사 후, MyApp 실행
      ],
      child: MyApp(),
    )



  );
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