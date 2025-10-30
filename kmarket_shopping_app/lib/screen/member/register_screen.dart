
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LRegisterScreenState();
}

class _LRegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입'),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('기본 정보 입력'),
                  const SizedBox(height: 20,),
                  _buildInputField(title: '아이디 입력'),
                  const SizedBox(height: 20,),
                  _buildInputField(title: '비밀번호 입력'),
                  const SizedBox(height: 20,),
                  _buildInputField(title: '비밀번호 확인'),
                  const SizedBox(height: 20,),
                  _buildInputField(title: '이메일 입력'),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                      children: [
                        ElevatedButton(onPressed: (){
                          // 목록 이동
                          Navigator.of(context).pop();
                        }, child: const Text('취소')),
                        const SizedBox(width: 20,),
                        ElevatedButton(onPressed: (){
                          // (가입 완료 페이지??)
                        }, child: const Text('가입'))
                      ],
                    ),
                  )
                ],
              )
          )
        ),
      ),
    );
  }

  // 입력 필드 디자인 함수
  Widget _buildInputField({required String title,}){

    return TextFormField(
      controller: null,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10)

      ),
    );
  }








}