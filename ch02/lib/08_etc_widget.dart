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
      home: const MyHomePage(title: '08.기타 나머지 위젯 실습'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column( // 여기서부터 실습 내용
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Text Left!!!', style: TextStyle(fontSize: 26)),

            // Center : 위젯을 가운데로 정렬
            Center(
              child: Text('Text Center!!!', style: TextStyle(fontSize: 26)),
            ),

            // Expanded : 비율로 배치
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.red,
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.green,
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.blue,
                    )
                )
              ],
            ),

            // Card
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.all(12),
              child: Container(
                width: 200,
                height: 50,
                child: Column(
                  children: [
                    Text('제목'),
                    Text('내용')
                  ]
                ),
              ),
            ),
            
            // Padding
            Padding(
                padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('padding 10')
                ],
              ),
            ),

            
            // Spacer : 위젯과 위젯 사이의 빈공간 배치
            Row(
              children: [
                // Icon : 웹 아이콘 출력 위젯
                Icon(
                  Icons.home,
                  size: 60,
                ),
                Icon(
                  Icons.favorite,
                  size: 60,
                  color: Colors.red,
                ),
              ],
            ),

            // SizedBox : 위젯과 취젯 사이에 여백을 줄 때 사용하는 위젯
            SizedBox(
              width: 300,
              height: 100,
              child: Container(
                color: Colors.blue,
              ),
            ),

            // SingleChildScrollView
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 400,
                    height: 200,
                    color: Colors.red,
                    child:Text('Box1'),
                  ),
                  Container(
                    width: 400,
                    height: 200,
                    color: Colors.blue,
                    child:Text('Box2'),
                  ),
                  Container(
                    width: 400,
                    height: 200,
                    color: Colors.yellow,
                    child:Text('Box3'),
                  )
                ],
              ),
            ),

          ],
        )

    );
  }
}