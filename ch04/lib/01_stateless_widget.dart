/*
  날짜 : 2025/10/27
  이름 : 이수연
  내용 : Stateless 정적 위젯 실습
*/

import 'package:flutter/material.dart';

// 실행
void main(){
  runApp(MyApp());
}

// MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('01.Stateless 정적 위젯 실습'),
        ),
        body: StatelessTest(), // 클래스 분리.
      ),
    );
  }
}

// 내용 클래스 - body 내용
class StatelessTest extends StatelessWidget { // StatelessWidget은 상태(속성)가 변경되어도 화면이 다시 갱신되지 않음
  StatelessTest({super.key});

  // 속성 선언
  // 속성이 변경되더라도 해당 속성을 참조하는 Text 위젯은 재빌드 되지 않음
  int counter = 0;

  void _increment(){
    counter++;
    print('counter : $counter');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('카운터 : $counter', style: TextStyle(fontSize: 24),),
        ElevatedButton(
            onPressed: _increment,
            child: const Text('카운트')
        )
      ],
    );
  }
  
}