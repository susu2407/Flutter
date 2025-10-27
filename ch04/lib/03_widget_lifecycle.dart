/*
  날짜 : 2025/10/27
  이름 : 이수연
  내용 : Stete 생명주기 실습
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
          title: const Text('03.Stete 생명주기 실습'),
        ),
        body: ParentWidget(), // 클래스 분리.
      ),
    );
  }
}

// 내용 클래스 - body 내용
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<StatefulWidget> { // Stateful은 정의, 구현이 구분되어야 함.

  // 상태
  int counter = 0;
  bool showChild = true;

  void _increment(){
    setState(() {
      counter++;
    });
  }

  void _toggleChild(){
    setState(() {
      showChild = !showChild;
    });
  }

  // build가 화면을 그리는 함수
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        
        showChild 
            ? ChildWidget(count: counter) // 참이면 실행
            : Text('ChildWidget 제거', style: TextStyle(fontSize: 26),), // 거짓이면 실행

        ElevatedButton(
            onPressed: _increment,
            child: const Text('ChildWidget 상태 변경')
        ),
        ElevatedButton(
            onPressed: _toggleChild,
            child: const Text('ChildWidget 생성/제거')
        )
        
      ],
    );
  }
  
}

// ChildWidget 선언 클래스
class ChildWidget extends StatefulWidget {

  ChildWidget({super.key, required this.count});

  int count;

  @override
  State<StatefulWidget> createState() {
    print('createState...');
    return _ChildWidgetState();
  }
}

// ChildWidget 구현 클래스
class _ChildWidgetState extends State<ChildWidget> {

  void initState() {

    // 위젯이 처음 트리에 삽입될 때, 한번만 호출
    print('initState...');
  }

  void didChangeDependencies(){
    print('didChangeDependencies...');
  }


  @override
  Widget build(BuildContext context) {
    print('build...');

    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: Text(
        'ChildWidget count : ${widget.count}',
        style: TextStyle(fontSize: 26),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    // 부모 위젯이 새 데이터와 함께 위젯을 rebuild 할 때 호출
    print('didUpdateWidget... old=${oldWidget.count}, new=${widget.count}');
  }

  @override
  void dispose() {
    // 해당 위젯이 위젯 트리에서 제거 될때 호출
    print('dispose...');
  }
}