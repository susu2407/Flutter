/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 05.Flutter REST API 실습 -user1
*/
import 'dart:developer';

import 'package:ch07/user1/user1.dart';
import 'package:ch07/user1/user1_modify.dart';
import 'package:ch07/user1/user1_register.dart';
import 'package:ch07/user1/user1_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User1List extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _User1ListState();
}

class _User1ListState extends State<User1List> {

  final service = User1Service();

  // late : 초기화를 연기하고 선언
  late Future<List<User1>> futureUserList;

  void initState(){
    super.initState();

    // 목록 데이터 요청하기
    futureUserList = service.getUsers();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User1 목록'),),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 등록 이동하고, 결과값(result)을 기다림
          final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => User1Register())
          );

          // result가 true면 목록을 새로고침
          if(result == true){
            setState(() {
              futureUserList = service.getUsers(); // <- 리스트 새로 불러오기
            });
          }
        },
        child: const Icon(Icons.add),
      ),

      body: FutureBuilder(
        future: futureUserList,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if(snapshot.hasError) {
            return Text('에러발생 : ${snapshot.error}');
          }

          final userList = snapshot.data!;

          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {

              final user = userList[index];

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user.name[0]),
                  ),
                  title: Text('${user.name}(${user.userid})'), // 회원이름(회원아이디)
                  subtitle: Text('${user.age}세(${user.birth})'), // 나이(생년월일)
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 수정
                      IconButton(
                        onPressed: () {
                          // 수정 화면 이동 : 새로운 화면을 스택 위로 쌓음
                          final modifiedUser = Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => User1Modify(userid: user.userid))
                          );

                          // modifiedUser가 널이 아니면, 수정 성공
                          if(modifiedUser != null) {
                            setState(() {
                              log('modified 성공!!!');
                              futureUserList = service.getUsers();
                            });
                          }


                        }, 
                        icon: Icon(Icons.edit), 
                        color: Colors.blue,
                      ),
                      // 삭제
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.red,),
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }
}