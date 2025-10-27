/*
  날짜 : 2025/10/27
  이름 : 이수연
  내용 : ListView 위젯 실습하기
*/

import 'package:flutter/material.dart';

void main() {
  runApp(ListViewTest1());

}

class ListViewTest1 extends StatelessWidget {
  const ListViewTest1({super.key}); // 식별자 코드(??)

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('01.ListView 위젯 실습'),),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                border: Border.all(
                  width: 1,
                  color: Colors.black
                )
              ),
            ),
            Container(
              width: double.infinity, // 가로 100%(전체 폭 차지)
              height: 60,
              child: const Text('2번째 항목'),
            ),
            Container(
              width: double.infinity, // 가로 100%(전체 폭 차지)
              height: 60,
              child: const Text('3번째 항목'),
            ),
          ],
        ),
      ),
    );
  }

}