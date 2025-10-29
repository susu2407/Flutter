/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 7장 02.FutureBuilder 비동기 처리 실습
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
        appBar: AppBar(title: const Text('02.FutureBuilder 비동기 처리 실습'),),
        body: FutureScreen(),
      ),
    );
  }
}

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {

  // Future 결과 상태 변수
  Future<String>? futureResult;

  // 비동기 처리 함수
  Future<String> fetchData(){  // 미래값이므로, 3초 후에 값이 반환. 그 Future값이 String이다.

    return Future.delayed(const Duration(seconds: 3), (){
      return '서버에서 가져온 데이터 입니다.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // FutureBuilder : 비동기 작업의 진행 상태에 따라서 자동으로 UI를 갱신해주는 위젯
          FutureBuilder(
            future: futureResult, // future 속성은 비동기 작업의 Future 결과 객체 // 3초 후에 반환되니깐, 그동안 indicator가 보이는 중.
            builder: (context, snapshot) { // snapshot은 현재 상태와 결과를 담고 있는 결과 객체

              if(snapshot.connectionState == ConnectionState.waiting){ // 비동기 처리가 진행 중인 경우
                return const CircularProgressIndicator(); // Indicator : 로딩바 이미지 종류
              }else if(snapshot.hasError){
                return Text('에러 발생 : ${snapshot.error}');
              }else if(snapshot.hasData){
                return Text('결과 : ${snapshot.data}');
              }else{
                return Text('데이터를 불러오세요.');
              }
            },
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
           setState(() {
             futureResult = fetchData(); // FutureBuilder의 future에 참조되고 있음.
           });
          }, child: const Text('데이터 불러오기')),
        ],
      ),
    );
  }
}

