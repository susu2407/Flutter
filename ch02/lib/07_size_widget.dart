import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // 앱 실행
}

class MyApp extends StatelessWidget { // 여기 손 댈 것 없음.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '뿅뿅마을',
      home: const MyHomePage(title: '07. Size Widget 실습'),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [

          // IntrinsicWidth : 같은 배치 관계에서 너비가 가장 큰 위젯을 기준으로 너비 크기가 결정
          Container(
            color: Colors.yellow,
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Colors.red, width: 150, height: 150, child: Text('A')),
                  Container(color: Colors.blue, width: 200, height: 200, child: Text('B')),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
