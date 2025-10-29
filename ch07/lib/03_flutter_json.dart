/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 7장 03.Flutter Json 처리 실습
*/
import 'dart:convert';

import 'package:flutter/material.dart';

class Todo { // ( 이런 것을 Flutter에서는 Model 클래스라고 한다.)
  int id;
  String title;
  bool complete;

  // 기본 생성자, 이름이 있는 매개변수
  Todo({required this.id, required this.title, required this.complete});

  // factory 생성자 -> Todo 객체
  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
        id: json['id'],
        title: json['title'],
        complete: json['complete']
    );
  }

  // Todo 객체 -> JSON 변환
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "complete": complete,
    };
  }

  // toString
  @override
  String toString() {
    return 'Todo{id: $id, title: $title, complete: $complete}';
  }

}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('03.Flutter Json 처리 실습'),),
        body: JsonScreen(),
      ),
    );
  }
}

class JsonScreen extends StatefulWidget {
  const JsonScreen({super.key});
  @override
  State<StatefulWidget> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {

  // JSON 문자열
  final String jsonString = ''' 
  {
    "id" : 1,
    "title" : "Flutter_JSON_실습",
    "complete" : false
  }
   ''';

  // (기본 파싱 처리?이니깐 한번 봅시다)
  Map<String, dynamic>? jsonData;
  Todo? todo;
  String? encodedJson;


  // JSON 문자열 -> Todo 객체 변환(Decoding)
  void decodingTodo(){

    setState(() { // 처리하고 화면 갱신까지
      Map<String, dynamic> todoMap = jsonDecode(jsonString); //(json.어쩌구.. 하는게 있죠?)
      todo = Todo.fromJson(todoMap);
    });

  }

  // Todo 객체 -> JSON 문자열 반환(Encoding)
  void encodingTodo(){
    setState(() {
      encodedJson = jsonEncode(todo?.toJson());
    });
  }

  // JSON 문자열 -> Map 객체 변환(Parsing)
  void parsingTodo(){
    setState(() {
      jsonData = jsonDecode(jsonString);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Todo : ${jsonData.toString()}'),
          ElevatedButton(onPressed: parsingTodo, child: const Text('JSON Parsing'),),
          const SizedBox(height: 20,),

          Text('Todo : ${todo.toString()}'),
          ElevatedButton(onPressed: decodingTodo, child: const Text('JSON Decode'),),
          const SizedBox(height: 20,),

          Text('User : ${encodedJson.toString()}'),
          ElevatedButton(onPressed: encodingTodo, child: const Text('JSON Encode'),),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
  
}