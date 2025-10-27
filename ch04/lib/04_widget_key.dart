/*
  날짜 : 202/10/27
  이름 : 이수연
  내용 :
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(title: const Text('04.위젯키 실습'),),
       body:  WidgetKeyTest(),
     ),
   );
  }
}

class WidgetKeyTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetKeyTestState();
}

class _WidgetKeyTestState extends State<WidgetKeyTest> {

  bool _swap = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: (){
              // 상태 변경
              setState(() {
                _swap = !_swap;
              });
            },
            child: const Text('순서 바꾸기')
        ),
        Row(
          // 상태 값을 사용
          children: _swap
              ? [ // ValueKey는 위젯을 구분하기 위한 식별값, 위젯 트리를 업데이트 할 때 위젯의 상태를 보존
                CounterBox(key: ValueKey(101), color: Colors.red),    // <- 얘(A)랑
                CounterBox(key: ValueKey(201),color: Colors.blue)     // <- 야(B)랑
              ]
              : [
                  CounterBox(key: ValueKey(201), color: Colors.blue), //<- 야(B)랑,
                  CounterBox(key: ValueKey(101), color: Colors.red)   // <- 얘(A)랑 같은 값을 공유하기 위해서 이렇게 작성.
                ],
        )
      ],
    );
  }
}

// “껍데기” (위젯 구조 정의)
class CounterBox extends StatefulWidget {

  final Color color;
  const CounterBox({super.key, required this.color}); // final Color color; 생성할 때에, 초기화.

  @override
  State<StatefulWidget> createState() => _CounterBoxState(); // StatefulWidget이 자신의 상태(State 클래스)를 연결하기 위한 다리 역할 // “이 위젯이 사용할 상태(State) 객체는 _CounterBoxState()야” 하고 연결시켜주는 역할.

}

// “속 내용” (값이 바뀌면 다시 그릴 로직)
class _CounterBoxState extends State<CounterBox> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _count++;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: widget.color,
        child: Center(
          child: Text(
            '_count : $_count',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}