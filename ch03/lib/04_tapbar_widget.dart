/*
  날짜 : 2025/10/27
  이름 : 이수연
  내용 : TabBar 위젯 실습하기
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

  //runApp(TapBarTest());
  runApp(BottomTabBarTest());

}

class TapBarTest extends StatelessWidget {
  const TapBarTest({super.key});

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      home: DefaultTabController(
        length: 3,  // 탭 개수
        child: Scaffold(
          appBar: AppBar(
            title: const Text('04.Tap Bar 위젯 실습'),
            bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.home),text: '홈',),
                  Tab(icon: Icon(Icons.star),text: '즐겨찾기',),
                  Tab(icon: Icon(Icons.person),text: '프로필',),
                ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('홈 화면', style: TextStyle(fontSize: 20),),),
              Center(child: Text('즐겨찾기 화면', style: TextStyle(fontSize: 20),),),
              Center(child: Text('프로필 화면', style: TextStyle(fontSize: 20),),),
            ],
          ),
        ),
      )
    );
  }
}

class BottomTabBarTest extends StatefulWidget {
  const BottomTabBarTest({super.key});

  @override
  State<StatefulWidget> createState() => _BottomTabBarTestState();

}

class _BottomTabBarTestState extends State<BottomTabBarTest> {

  int _selectiedIndex = 0;

  // 탭 화면 위젯 리스트
  List<Widget> _widgetList = [
    Center(child: Text('홈 화면', style: TextStyle(fontSize: 20),),),
    Center(child: Text('즐겨찾기 화면', style: TextStyle(fontSize: 20),),),
    Center(child: Text('프로필 화면', style: TextStyle(fontSize: 20),),),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('04.Bottom Tabbar 실습'),
        ),
        body: _widgetList.elementAt(_selectiedIndex),

        // 텝바를 아래에 위치
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
              BottomNavigationBarItem(icon: Icon(Icons.star), label: '즐겨찾기'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
            ],
          currentIndex: _selectiedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index){
              setState(() {
                _selectiedIndex = index;
              });
          },
        ),


      ),
    );
  }

}



