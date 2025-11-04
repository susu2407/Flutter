/*
  날짜 : 2025/10/30
  이름 : 이수연
  내용 : 쇼핑몰앱 만들기

  - 10.30 :
      - 전반적인 화면 구현 : screens/main/ (화면 구현-메인 화면, 카테고리 탭, 검색, 마이페이지, 장바구니, 스플래시)
      - pubspec.yaml 등록 : imges/.. 등록
      - 회원가입, 약관 (pubspec.yaml - http: ^1.5.0 등록)
      - 카테고리
  - 10.31 :
      - 로그인 : 로그인, 토큰, ...
  - 11.03 :
      - 2차 카테고리
      - 상품 목록(목록 불러오기, 목록 디자인)
      - 상품 아이템
      - 무한 스크롤
      - 상품 뷰(상품 상세 설명)
  - 11.04 :
      - 장바구니 (등록, 목록, 목록 옆에 삭제)
      - 화면 구현까지만 (아래에 결제 버튼, 상품 선택x, 합산 금액x)
      - ※ ListTile 사용하지 말자. 상품이미지 조절이 힘들다.
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