/*
  날짜 : 2025/10/28
  이름 : 이수연
  내용 : Flutter 5장 01.상태 관리 기본
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('01.상태 관리 기본'),),
        body: ParentStateApp(),
      ),
    );
  }
}

class ParentStateApp extends StatefulWidget {
  const ParentStateApp({super.key});

  @override
  State<StatefulWidget> createState() => _ParentStateAppState();
}

class _ParentStateAppState extends State<ParentStateApp> {

  // (위젯에서 사용하는) 상태 속성 - 이게 상태다! 중요!! // 상태라는 것은 위젯에서 사용하는 속성
  // 상태 속성
  int _count = 0;
  String _text = '';

  // 자식 위젯에서 사용할 상태
  bool _favorited = false;
  int _favoritedCount = 0;

  void toggleFavorite(){
    setState(() {
      if(_favorited){
        _favorited = false;
        _favoritedCount -= 1;
      }else{
        _favorited = true;
        _favoritedCount += 1;
      }
    });

    print('_favorited : $_favorited');
  }

  void increment(){
    // 위젯 상태를 업데이트 하고 UI 재빌드(build 호출)
    setState(() {
      _count++;
    });
    print('_count : $_count');
  }

  void changeText(String newText){
    // 위젯 상태를 업데이트 하고 UI 재빌드(build 호출)
    setState(() {
      _text = newText;
    });
    print('_text : $_text');
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽(start) 정렬
        children: [
          Text('Count : $_count'),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: increment,
            child: const Text('증가'),
          ),

          Divider(), // Divider : 수평선 추가
          Text(_text),
          const SizedBox(height: 10,),
          TextField( // TextField에는 TextForm과의 차이는 유효성 검사를 가능 유무. 이건 안됨.
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '아무거나 입력',
            ),
            onChanged: (value){
              changeText(value);
            },
          ),

          Divider(), // Divider : 수평선 추가
          const SizedBox(height: 10,),
          IconWidget(favorited: _favorited, toggleFunction: toggleFavorite,),
          ContentWidget(favoriteCount: _favoritedCount,),

        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {

  // 부모 위젯에 있는 속성을 받아 올 것
  final bool favorited;
  final Function toggleFunction;

  // final이 붙어 있으므로, 생성자를 강제하여야 함??
  const IconWidget({super.key, this.favorited = false, required this.toggleFunction});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: (){
          toggleFunction;
        },
        icon: (favorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        iconSize: 100,
        color: Colors.red,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {

  final int favoriteCount;

  const ContentWidget({super.key, required this.favoriteCount});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'favoriteCount : ',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
