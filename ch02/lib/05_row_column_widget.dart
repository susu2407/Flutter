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
      home: const MyHomePage(title: '05. Row/Column Widget 실습'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row : 위젯을 가로로 배치하는 위젯
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ],
          ),

          // Colum : 위젯을 세로로 배치하는 위젯
          Column(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ],
          ),

          Row(
            children: [
              Column(
                children: [
                  Text('벗꽃'),
                  Image.asset(
                    'images/flower1.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Column(
                children: [
                  Text('코스모스'),
                  Image.asset(
                    'images/flower2.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Column(
                children: [
                  Text('챠챠'),
                  Image.asset(
                    'images/flower3.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                ],
              )
            ],
          ),

          Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(width: 1)
            ),
            margin: EdgeInsets.symmetric(vertical: 10), // 위,아래 여백 10
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // 기본축 정렬
              crossAxisAlignment: CrossAxisAlignment.start, // 교차축 정렬
              children: [
                Container(width: 50, height: 100, color: Colors.red,),
                Container(width: 50, height: 50, color: Colors.green,),
                Container(width: 50, height: 150, color: Colors.blue,)
              ],
            ),
          )

        ],
      )
    );
  }
}
