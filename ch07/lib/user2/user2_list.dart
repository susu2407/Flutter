/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 05.Flutter REST API 복습 - user2
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User2List extends StatefulWidget {
  const User2List({super.key});

  @override
  State<StatefulWidget> createState() => _User2ListState();

}

class _User2ListState extends State<User2List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User2 목록'),),
      //body: FutureBuilder(future: null, builder: (context, snapshot){}),
    );
  }

}
