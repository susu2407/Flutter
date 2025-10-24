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
      home: const MyHomePage(title: '04. Container Widget 실습'),
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
          Container(
            width: 100,
            height: 100,
            color: Colors.lightBlueAccent,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text('Blue'),
          ),
          Container(
            width: 100,
            height: 100,
            // color: Colors.amber, // decoration 속성을 선언하면 color 속성과 충돌나서 에러
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              border: Border.all(width: 1, color: Colors.black)
            ),
            child: Text('Amber'),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.orange),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('images/flower1.jpg'),
                  fit: BoxFit.cover)
            ),
          ),
        ],
      )
    );
  }
}
