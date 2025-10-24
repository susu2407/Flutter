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
      home: const MyHomePage(title: '02.Image Widget 실습'),
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
          /*
            이미지 에셋 등록 설정
             - pubspec.yaml > flutter 하위에 assets 주석 제거 후 이미지 경로 입력
          */
          Image.asset('images/flower1.jpg'),
          Image.asset(''
              'images/flower2.jpg',
              width: 200,
              height: 200,
          ),
          Image.asset(
              'images/flower3.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
            repeat: ImageRepeat.noRepeat,
          ),
          Image.network(
              'https://picsum.photos/id/237/200/300',
            width: 100,
            height: 100,
          )
        ],
      )
    );
  }
}
