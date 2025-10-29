/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 05.Flutter REST API 실습 -user1 서비스
*/

import 'dart:convert';
import 'dart:developer';

import 'package:ch07/user1/user1.dart';

import 'package:http/http.dart' as http;

class User1Service {

  // API 서비스 클래스 // Flutter 에뮬레이터에서 localhost는 자기자신이기 때문에 외부 에뮬레이터 외부 IP 주소 사용
  //static const String baseUrl = 'http://localhost:8u080/ch08';
  static const String baseUrl = 'http://10.0.2.2:8080/ch08';


  // 목록 보이기
    // GET : 모든 사용자 조회, 서버 요청이 끝날 때까지 기다리지 않고 바로 Future를 반환
  Future<List<User1>> getUsers() async {
    try {
      // 일반 콘솔로 출력
      log('here1');
      final response = await http.get(Uri.parse('$baseUrl/user1'));

      log(response.toString());

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList.map((json) => User1.fromJson(json)).toList();
      } else {
        throw Exception('사용자 목록을 불러오는데 실패했습니다.');
      }

    }catch(e){
      throw Exception('네트워크 에러: $e');
    }

  }


  void getUser(){}

  // 등록
  Future<User1> postUser(User1 user) async {

    try{

      final response = await http.post(
        Uri.parse('$baseUrl/user1'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson())
      );

      if(response.statusCode == 201){
        return User1.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('예외발생 : ${response.statusCode}');
      }

    }catch(err){
      throw Exception('에러 발생 : $err');
    }

  }

  void putUser(){}

  void deleteUser(){}

}