/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 7장 01.Flutter 비동기 처리 실습
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
        appBar: AppBar(title: const Text('01.Flutter 비동기 처리 실습'),),
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

  // 상태값 두개~
  String result = '결과 대기중...';
  bool isLoading = false;

  // 비동기 처리 함수 //////////////////////////////////////////
  Future<String> fetchData(){  // 미래값이므로, 3초 후에 값이 반환. 그 Future값이 String이다.

    return Future.delayed(const Duration(seconds: 3), (){
      return '서버에서 가져온 데이터 입니다.';
    });
  }

  void loadDate(){

    // 로딩2부터 실행되고, fetchData가 실행됨.
    setState(() {
      result = '로딩 중...1'; // 순차적으로 진행되는 것이 아닌 것을 비동기처리라고 함.
    }); // 갱신

    fetchData().then((data){ // fetchData() 들어오면
      setState(() {
        result = data; // 3초 뒤에 실행.
      });
    }).catchError((err){
        setState(() {
          result = err;
        });
    }).whenComplete((){
      setState(() {
        print('작업 완료!');
      });
    });

    setState(() {
      result = '로딩 중...2';
    }); // 갱신

  }

  // 카운트 비동기 처리 //////////////////////////
  int count = 0;
  bool isCounting = false;

  Future<int> startCounting() async { // ??????

    setState(() {
      isCounting = true;
    });

    // 1초에 한번씩 갱신되도록.
    for(int i=1 ; i<=10 ; i++){

      await Future.delayed(const Duration(seconds: 1)); // 1초 멈추가 진행 // Future가 비동기이므로 await를 붙여줘야 함. async await !!

      setState(() {
        count = i;
      });

    }

    setState(() {
      isCounting = false;
    });

    return count;

  }

  void handleCount() async {
    int result = await startCounting();

    setState(() {
      count = result + 1; // 최종카운트 = 11, 1,2,3, ..10, 11 (10은 너무빨라서)
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10), // 사방 마진 10
      child: Column(
        children: [
          Text(result, style: TextStyle(fontSize: 16),), // result 상태 불러오기?
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            loadDate(); // 버튼 누르면 이 메서드가 작동하도록 메서드 불러오기.
          }, child: const Text('데이터 불러오기')),
          const SizedBox(height: 10,),
          Text('결과 출력 : $count'),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            handleCount();
          }, child: const Text('데이터 불러오기')),
        ],
      ),
    );
  }
}

