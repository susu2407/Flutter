import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // 앱 실행
}

class MyApp extends StatelessWidget { // 여기 손 댈 것 없음.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Widget Test',
      home: const MyHomePage(title: 'Text Widget Test Home Page'),
    );
  }
}

// 여기서부터는 따로 뺄 것.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // 구성
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // 이름 규칙있음.(학습예정)
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold( // 실제 화면 골격
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column( // 수직으로 출력하는 위젯, 컬럼(레이아웃 속성이 기본값으로 되어 잇음)의 칠드런 속성
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1. 텍스트 위젯 실습'),

          // 일반 텍스트 위젯
          Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),),

          Text(
              '동래물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세',
            style: TextStyle(
              fontSize: 16
            ),
            overflow: TextOverflow.ellipsis,
          ),

          // 문자열 문자 스타일
          Text.rich(
            TextSpan(
              text: 'HE',
              children: [
                TextSpan(
                    text: 'LLO',
                    style: TextStyle(color: Colors.red)
                ),
                TextSpan(
                  text: 'WOR',
                  style: TextStyle(color: Colors.blue)
                ),
                TextSpan(
                    text: 'LD',
                    style: TextStyle(color: Colors.green)
                )
              ]
            )
          )
        ],

      )
    );
  }
}
