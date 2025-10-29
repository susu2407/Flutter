/*
  날짜 : 2025/10/27
  이름 : 이수연
  내용 : ListView 위젯 실습하기
*/

import 'package:flutter/material.dart';

void main() {
  // ListView 실습
  // runApp(ListViewTest1());

  // ListView.builder 실습
  // runApp(ListViewTest2());

  // ListView.seperaged 실습
  runApp(ListViewTest3());

}

class ListViewTest1 extends StatelessWidget {
  const ListViewTest1({super.key}); // 위젯 식별자 코드(??)

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('01.ListView 위젯 실습'),),
        body: ListView( // 정적인 화면을 출력할 때에 사용. 모든 페이지를 처음에 다 출력하여, 낭비가 될 수도 있음.
          children: [
            for(int i=1; i<=5; i++)
              Container(
                padding: EdgeInsets.all(10), // EdgeInsets.all(double value) : 모든 방향 동일한 여백
                margin: EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(
                        width: 1,
                        color: Colors.black
                    )
                ),
                child: Text('${i}번째 항목'),
              ),

            // List타입의 아이템 ...인데.
            // ListTitle은 리스트 아이템 항목을 구성하는 위젯
            ListTile(
              leading: const Icon(Icons.sunny),
              title: const Text('ListTitle 제목'),
              subtitle: const Text('ListTitle 내용'),
              trailing: const Icon(Icons.menu),
            ),

            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
              ),
              title: const Text('ListTitle 제목'),
              subtitle: const Text('ListTitle 내용'),
              trailing: const Icon(Icons.menu),
              onTap: (){
                print('클릭!');
              },
            )
          ],
        ),
      ),
    );
  }
}

class ListViewTest2 extends StatelessWidget {
  const ListViewTest2({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> personList = ['김유신', '김춘추', '장보고', '강감찬', '이순신',
        '정약용', '안중근', '유관순', '안창호', '김철학'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('02.ListView.builder 실습'),),
        body: ListView.builder(           //ListView.builder는 아이템 갯수가 많거나 동적으로 위젯을 생성해서 메모리 자원을 효율적으로 사용
          itemCount: personList.length,   // 목록에 출력할 아이템 총 개수
          itemBuilder: (context, index){  // 인덱스를 기반으로 각 아이템 위젯 생성
            return Container(
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
              child: Text('${personList[index]}'),
            );
        }),
      ),
    );
  }
}

class ListViewTest3 extends StatelessWidget {
  const ListViewTest3({super.key});

  @override
  Widget build(BuildContext context) {

    List<User> userList = [
      User('a101', '김유신', '1990-09-01', 23, 'https://picsum.photos/id/237/200/300'),
      User('a102', '김춘추', '1991-09-02', 33, 'https://picsum.photos/id/238/200/300'),
      User('a103', '장보고', '1992-09-03', 43, 'https://picsum.photos/id/239/200/300'),
      User('a104', '강감찬', '1993-09-04', 53, 'https://picsum.photos/id/240/200/300'),
      User('a105', '이순신', '1994-09-05', 63, 'https://picsum.photos/id/241/200/300'),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('03.ListView.separated 실습'),),
        body: ListView.separated(             //ListView.separated는 ListView.builder에서 목록 구분서을 커스텀 할 수 있는 위젯
            itemCount: userList.length,       // 목록에 출력할 아이템 총 개수
            itemBuilder: (context, index){    // 인덱스를 기반으로 각 아이템 위젯 생성
              return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(userList[index].avatar),
                  ),
                  title: Text('${userList[index].name}(${userList[index].userid})'), // 표현식 주의하기
                  subtitle: Text(userList[index].birth),
                  trailing: const Icon(Icons.more_vert),
                  onTap: (){
                    print('클릭!');
                  },
              );
            },
          separatorBuilder: (BuildContext context, int index){
              return Divider(height: 1, color: Colors.black,);  //Divider : 구분선
          },
        ),
      ),
    );
  }
}


// User 모델(Spring의 DTO역할)
class User {
  String userid;
  String name;
  String birth;
  int age;
  String avatar;

  User(this.userid, this.name, this.birth, this.age, this.avatar);
}