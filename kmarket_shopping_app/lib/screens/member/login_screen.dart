
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmarket_shopping_app/providers/auth_provider.dart';
import 'package:kmarket_shopping_app/screens/member/terms_screen.dart';
import 'package:kmarket_shopping_app/services/member_service.dart';
import 'package:kmarket_shopping_app/services/token_storage_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  
  final service = MemberService();
  final tokenStorageService = TokenStorageService();
  
  Future<void> _procLogin() async {
    
    final usid = _idController.text;
    final pass = _pwController.text;
    
    if(usid.isEmpty || pass.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('아이디, 비번 입력하세요.'))
      );
      return;
    }

    // (Form으로 하지 않고, 이 방법↓으로 진행해보자.)
    // (memberservice에서 login()함수를 볼러와서...)

    try {
      // 서비스 호출
      Map<String, dynamic> jsonData = await service.login(usid, pass);

      String? accessToken = jsonData['accessToken'];
      log('accessToken : $accessToken'); // (제대로 들어오는지 확인을 위한 로그)

      if(accessToken != null){
        // 토큰 저장 (SharedPreference or SecurePreference) → Provider로 저장
          //tokenStorageService.savedToken(accessToken);
        await context.read<AuthProvider>().login(accessToken);

        // 로그인 화면 닫기
        Navigator.of(context).pop(); // (메인화면으로 돌아가기, 로그인 아이콘으로 마이페이지 아이콘으로 바꾸기)
      }

    } catch(err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString()),)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인'),),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png'),
              const SizedBox(height: 20,),

              const Text('쇼핑몰 로그인', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: '아이디 입력',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _pwController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호 입력',
                  border: OutlineInputBorder()
              ),),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: _procLogin,
                    child: const Text('로그인', style: TextStyle(fontSize: 20, color: Colors.black ),)
                ),
              ),
              const SizedBox(height: 10,),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => TermsScreen()),
                    );
                  },
                  child: const Text('회원가입', style: TextStyle(color: Colors.black ),),
              )
            ],
          ),
        ),
      ),
    );
  }

}