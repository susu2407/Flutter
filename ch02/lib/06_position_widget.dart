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
      home: const MyHomePage(title: '06.위치 관련 위젯 실습'),
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

            // Align : 특정 위치에 배치하기
            Container(
              width: double.infinity, // 가로폭 100%
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1)
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),

            // FractionalOffset : 특정 위치 좌표로 배치하기
            Container(
              width: double.infinity, // 가로폭 100%
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 1)
              ),
              child: Align(
                alignment: FractionalOffset(0.2, 0.3),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),

            // Stack : 위젯을 겹쳐서 배치
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                )
              ],
            ),
            
            // IndexedStack : 위젯을 겹쳐서 배치하고 인덱스 번호로 화면에 표시
            IndexedStack( // 탭할 때에 쓰임.
              index: 1,
              children: [
                Text('첫번째 텍스트', style: TextStyle(fontSize: 24),),
                Text('두번째 텍스트', style: TextStyle(fontSize: 24),),
                Text('세번째 텍스트', style: TextStyle(fontSize: 24),),
              ],
            ),

            // Positioned
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1)
              ),
            child: Stack(
              children: [
                Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    )
                ),
                Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    )
                )
              ],
            ),
            )










            ],
        )
    );
  }
}
