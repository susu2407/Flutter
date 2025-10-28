/*
  날짜 : 2025/10/28
  이름 : 이수연
  내용 : Flutter 5장 02.Provider 상태관리 실습
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider 정의(App 공용 상태 저장소) //ChangeNotifier 얘를 상속 받아야 provider
class CounterProvider extends ChangeNotifier {
  // 상태 선언
  int _count = 0;

  // 상태값에 접근할 수 있는 Getter
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners(); // 상태 변경 알림
  }

  void decrement(){
    _count--;
    notifyListeners(); // 상태 변경 알림
  }

}

// provider가 최상단에 오도록, MyApp()을 Provider로 감싸줘야 한다.
void main() {
  runApp(
    // provider 의존성 설정 : pubspec.yaml >  flutter : provider: ^6.1.5+1 추가(pub.bev에서 provider 검색)
    ChangeNotifierProvider(
      create: (_)=> CounterProvider(), // _ 맥개변수는 context가 들어오지만 우리는 이 함수에서 사용 하지 않겠다는 선언
      child: MyApp(), // MyApp 하위 위젯 트리에서 CounterProvider 접근
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('02.Provider 상태관리 실습'),),
        body: ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {


  @override
  Widget build(BuildContext context) {

    // provider 접근하기 // provider 객체라고 생각하면 되겠죠.
    final counterProvider = context.watch<CounterProvider>();

    return Column(
      children: [
        Text(
          'Parent Provider count : ${counterProvider._count}', // Getter 호출
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  counterProvider.increment();
                },
                child: const Text('증가')
            ),

            ElevatedButton(
                onPressed: (){
                  counterProvider.decrement();
                },
                child: const Text('감소')
            ),
          ],
        ),
      ],
    );
  }
}


