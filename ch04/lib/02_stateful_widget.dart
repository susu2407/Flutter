/*
  날짜 : 2025/10/27
  이름 : 이수연
  내용 : Stateful 동적 위젯 실습
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
          title: const Text('02.Stateful 동적 위젯 실습'),
        ),
        body: StatefulTest(), // 클래스 분리.
      ),
    );
  }
}

// 내용 클래스 - body 내용

// Stateful 위젯은 상태를 통해 화며을 갱신하는 동적 위젯
class StatefulTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatefulTestState();
}

class _StatefulTestState extends State<StatefulWidget> { // Stateful은 정의, 구현이 구분되어야 함.

  // 상태 속성
  int counter = 0;

  void _increment(){

    // 상태를 업데이트하고,
    setState(() {
      counter++;
    });

    print('counter : $counter');
  }

  @override
  Widget build(BuildContext context) { // build가 화면을 그리는 함수

    print('build...');

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